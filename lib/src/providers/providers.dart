import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../core/api/api_client.dart';
import '../core/auth/auth_service.dart';
import '../core/cache/hive_setup.dart';
import '../core/mock_data/mock_data.dart';
import '../models/product.dart';
import '../models/user.dart';
import 'product_catalog_provider.dart';

final apiClientProvider = Provider<ApiClient>((ref) => ApiClient());

final authServiceProvider = Provider<AuthService>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return AuthService(apiClient);
});

final currentUserProvider = FutureProvider<User?>((ref) async {
  final authService = ref.read(authServiceProvider);
  return authService.currentUser;
});

final isAuthenticatedProvider = FutureProvider<bool>((ref) async {
  final authService = ref.read(authServiceProvider);
  return authService.isAuthenticated;
});

// Legacy provider for backwards compatibility
final productListProvider = FutureProvider<List<Product>>((ref) async {
  final catalogAsync = ref.watch(productCatalogProvider);
  return catalogAsync.when(
    data: (products) => products,
    loading: () => <Product>[],
    error: (error, stack) => <Product>[],
  );
});

final productsByCategoryProvider = FutureProvider.family<List<Product>, String>((ref, categoryId) async {
  final apiClient = ref.read(apiClientProvider);

  try {
    final response = await apiClient.get('/products/category/$categoryId');
    return (response.data['data'] as List)
        .map((json) => Product.fromJson(json))
        .toList();
  } catch (e) {
    final cachedProducts = HiveSetup.productsBox.values
        .where((product) => product.category == categoryId)
        .toList();

    if (cachedProducts.isNotEmpty) {
      return cachedProducts;
    }
    // Return filtered mock data for demo
    return MockData.products.where((product) => product.category == categoryId).toList();
  }
});

final productProvider = FutureProvider.family<Product?, String>((ref, productId) async {
  final apiClient = ref.read(apiClientProvider);
  final cachedProduct = HiveSetup.productsBox.get(productId);

  try {
    final response = await apiClient.get('/products/$productId');
    final product = Product.fromJson(response.data['data']);

    await HiveSetup.productsBox.put(product.id, product);
    return product;
  } catch (e) {
    if (cachedProduct != null) {
      return cachedProduct;
    }
    // Return mock product for demo
    return MockData.products.firstWhere(
      (product) => product.id == productId,
      orElse: () => MockData.products.first,
    );
  }
});

final categoriesProvider = FutureProvider<List<Category>>((ref) async {
  final apiClient = ref.read(apiClientProvider);

  try {
    final response = await apiClient.get('/categories');
    return (response.data['data'] as List)
        .map((json) => Category.fromJson(json))
        .toList();
  } catch (e) {
    // Return mock categories for demo
    return MockData.categories;
  }
});

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super([]) {
    _loadCartFromStorage();
  }

  void _loadCartFromStorage() {
    final cartData = HiveSetup.cartBox.get('items', defaultValue: <String, dynamic>{});
    if (cartData is Map) {
      final items = cartData.entries
          .map((entry) => CartItem.fromJson(Map<String, dynamic>.from(entry.value)))
          .toList();
      state = items;
    }
  }

  void _saveCartToStorage() {
    final cartData = <String, dynamic>{};
    for (int i = 0; i < state.length; i++) {
      cartData[i.toString()] = state[i].toJson();
    }
    HiveSetup.cartBox.put('items', cartData);
  }

  void addItem(CartItem item) {
    final existingIndex = state.indexWhere(
      (cartItem) => cartItem.productId == item.productId && cartItem.variantId == item.variantId,
    );

    if (existingIndex >= 0) {
      final existingItem = state[existingIndex];
      final updatedItem = existingItem.copyWith(
        quantity: existingItem.quantity + item.quantity,
      );
      state = [
        ...state.sublist(0, existingIndex),
        updatedItem,
        ...state.sublist(existingIndex + 1),
      ];
    } else {
      state = [...state, item];
    }

    _saveCartToStorage();
  }

  void updateQuantity(String productId, String variantId, int quantity) {
    if (quantity <= 0) {
      removeItem(productId, variantId);
      return;
    }

    final index = state.indexWhere(
      (item) => item.productId == productId && item.variantId == variantId,
    );

    if (index >= 0) {
      final updatedItem = state[index].copyWith(quantity: quantity);
      state = [
        ...state.sublist(0, index),
        updatedItem,
        ...state.sublist(index + 1),
      ];
      _saveCartToStorage();
    }
  }

  void removeItem(String productId, String variantId) {
    state = state.where(
      (item) => !(item.productId == productId && item.variantId == variantId),
    ).toList();
    _saveCartToStorage();
  }

  void clearCart() {
    state = [];
    HiveSetup.cartBox.delete('items');
  }

  double get total {
    return state.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }

  int get itemCount {
    return state.fold(0, (sum, item) => sum + item.quantity);
  }
}

final ordersProvider = FutureProvider<List<Order>>((ref) async {
  final apiClient = ref.read(apiClientProvider);

  try {
    final response = await apiClient.get('/orders');
    return (response.data['data'] as List)
        .map((json) => Order.fromJson(json))
        .toList();
  } catch (e) {
    // Return mock orders for demo
    return MockData.mockOrders;
  }
});

final addressesProvider = StateNotifierProvider<AddressesNotifier, List<DeliveryAddress>>((ref) {
  return AddressesNotifier();
});

class AddressesNotifier extends StateNotifier<List<DeliveryAddress>> {
  AddressesNotifier() : super([]) {
    _loadAddressesFromStorage();
  }

  void _loadAddressesFromStorage() {
    final addressesData = HiveSetup.addressesBox.get('addresses', defaultValue: <String, dynamic>{});
    if (addressesData is Map) {
      final addresses = addressesData.entries
          .map((entry) => DeliveryAddress.fromJson(Map<String, dynamic>.from(entry.value)))
          .toList();
      state = addresses;
    } else {
      // Load mock addresses for demo
      state = MockData.mockAddresses;
    }
  }

  void _saveAddressesToStorage() {
    final addressesData = <String, dynamic>{};
    for (int i = 0; i < state.length; i++) {
      addressesData[i.toString()] = state[i].toJson();
    }
    HiveSetup.addressesBox.put('addresses', addressesData);
  }

  void addAddress(DeliveryAddress address) {
    state = [...state, address];
    _saveAddressesToStorage();
  }

  void updateAddress(DeliveryAddress address) {
    final index = state.indexWhere((a) => a.id == address.id);
    if (index >= 0) {
      state = [
        ...state.sublist(0, index),
        address,
        ...state.sublist(index + 1),
      ];
      _saveAddressesToStorage();
    }
  }

  void removeAddress(String addressId) {
    state = state.where((address) => address.id != addressId).toList();
    _saveAddressesToStorage();
  }

  void setDefaultAddress(String addressId) {
    state = state.map((address) {
      return address.copyWith(isDefault: address.id == addressId);
    }).toList();
    _saveAddressesToStorage();
  }
}