import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../config/env.dart';
import '../mock_data/mock_data.dart';

class ApiClient {
  static const _tokenKey = 'auth_token';
  static const _refreshTokenKey = 'refresh_token';

  late final Dio _dio;

  ApiClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: Environment.apiBaseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _dio.interceptors.add(_AuthInterceptor());
    _dio.interceptors.add(_LoggingInterceptor());
  }

  Dio get dio => _dio;

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    if (Environment.useMockData) {
      return _getMockResponse<T>(path, queryParameters);
    }
    return _dio.get<T>(path, queryParameters: queryParameters, options: options);
  }

  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    if (Environment.useMockData) {
      return _postMockResponse<T>(path, data);
    }
    return _dio.post<T>(path, data: data, queryParameters: queryParameters, options: options);
  }

  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return _dio.put<T>(path, data: data, queryParameters: queryParameters, options: options);
  }

  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return _dio.delete<T>(path, data: data, queryParameters: queryParameters, options: options);
  }

  // Mock responses for frontend demo
  Future<Response<T>> _getMockResponse<T>(String path, Map<String, dynamic>? queryParameters) async {
    await Future.delayed(const Duration(milliseconds: 500)); // Simulate network delay

    late dynamic mockData;

    if (path == '/products') {
      mockData = {'data': MockData.products.map((p) => p.toJson()).toList()};
    } else if (path.startsWith('/products/category/')) {
      final categoryId = path.split('/').last;
      final filteredProducts = MockData.products.where((p) => p.category == categoryId).toList();
      mockData = {'data': filteredProducts.map((p) => p.toJson()).toList()};
    } else if (path.startsWith('/products/')) {
      final productId = path.split('/').last;
      final product = MockData.products.firstWhere(
        (p) => p.id == productId,
        orElse: () => MockData.products.first,
      );
      mockData = {'data': product.toJson()};
    } else if (path == '/categories') {
      mockData = {'data': MockData.categories.map((c) => c.toJson()).toList()};
    } else if (path == '/orders') {
      mockData = {'data': MockData.mockOrders.map((o) => o.toJson()).toList()};
    } else {
      mockData = {'data': []};
    }

    return Response<T>(
      data: mockData as T,
      statusCode: 200,
      requestOptions: RequestOptions(path: path),
    );
  }

  Future<Response<T>> _postMockResponse<T>(String path, dynamic data) async {
    await Future.delayed(const Duration(milliseconds: 800)); // Simulate network delay

    late dynamic mockData;

    if (path == '/auth/login') {
      mockData = {
        'user': MockData.mockUser.toJson(),
        'access_token': 'mock_access_token_123',
        'refresh_token': 'mock_refresh_token_456',
      };
    } else if (path == '/auth/register') {
      mockData = {
        'user': MockData.mockUser.toJson(),
        'access_token': 'mock_access_token_123',
        'refresh_token': 'mock_refresh_token_456',
      };
    } else if (path == '/auth/refresh') {
      mockData = {
        'access_token': 'mock_access_token_new_123',
        'refresh_token': 'mock_refresh_token_new_456',
      };
    } else if (path == '/auth/logout') {
      mockData = {'message': 'Logged out successfully'};
    } else if (path == '/auth/reset-password') {
      mockData = {'message': 'Password reset email sent'};
    } else {
      mockData = {'message': 'Success'};
    }

    return Response<T>(
      data: mockData as T,
      statusCode: path == '/auth/register' ? 201 : 200,
      requestOptions: RequestOptions(path: path),
    );
  }
}

class _AuthInterceptor extends Interceptor {
  static const _storage = FlutterSecureStorage();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _storage.read(key: ApiClient._tokenKey);
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final refreshed = await _refreshToken();
      if (refreshed && err.requestOptions.headers['retry'] != 'true') {
        err.requestOptions.headers['retry'] = 'true';
        final token = await _storage.read(key: ApiClient._tokenKey);
        err.requestOptions.headers['Authorization'] = 'Bearer $token';

        final dio = Dio();
        try {
          final response = await dio.fetch(err.requestOptions);
          handler.resolve(response);
          return;
        } catch (e) {
          handler.reject(err);
          return;
        }
      }

      await _storage.delete(key: ApiClient._tokenKey);
      await _storage.delete(key: ApiClient._refreshTokenKey);
    }
    handler.next(err);
  }

  Future<bool> _refreshToken() async {
    try {
      final refreshToken = await _storage.read(key: ApiClient._refreshTokenKey);
      if (refreshToken == null) return false;

      final dio = Dio(BaseOptions(baseUrl: Environment.apiBaseUrl));
      final response = await dio.post('/auth/refresh', data: {
        'refresh_token': refreshToken,
      });

      if (response.statusCode == 200) {
        final newToken = response.data['access_token'];
        final newRefreshToken = response.data['refresh_token'];

        await _storage.write(key: ApiClient._tokenKey, value: newToken);
        await _storage.write(key: ApiClient._refreshTokenKey, value: newRefreshToken);

        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }
}

class _LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!Environment.isProduction) {
      print('REQUEST: ${options.method} ${options.uri}');
      print('HEADERS: ${options.headers}');
      if (options.data != null) {
        print('DATA: ${options.data}');
      }
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (!Environment.isProduction) {
      print('RESPONSE: ${response.statusCode} ${response.requestOptions.uri}');
      print('DATA: ${response.data}');
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (!Environment.isProduction) {
      print('ERROR: ${err.message}');
      print('RESPONSE: ${err.response?.data}');
    }
    handler.next(err);
  }
}