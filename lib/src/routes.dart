import 'package:flutter/cupertino.dart';

import 'screens/cart/cart_screen.dart';
import 'screens/checkout/checkout_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/orders/orders_screen.dart';
import 'screens/product/product_detail_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/splash_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String home = '/home';
  static const String productDetail = '/product-detail';
  static const String cart = '/cart';
  static const String checkout = '/checkout';
  static const String orders = '/orders';
  static const String profile = '/profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return CupertinoPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );
      case onboarding:
        return CupertinoPageRoute(
          builder: (_) => const OnboardingScreen(),
          settings: settings,
        );
      case login:
        return CupertinoPageRoute(
          builder: (_) => const LoginScreen(),
          settings: settings,
        );
      case home:
        return CupertinoPageRoute(
          builder: (_) => const HomeScreen(),
          settings: settings,
        );
      case productDetail:
        final productId = settings.arguments as String;
        return CupertinoPageRoute(
          builder: (_) => ProductDetailScreen(productId: productId),
          settings: settings,
        );
      case cart:
        return CupertinoPageRoute(
          builder: (_) => const CartScreen(),
          settings: settings,
        );
      case checkout:
        return CupertinoPageRoute(
          builder: (_) => const CheckoutScreen(),
          settings: settings,
        );
      case orders:
        return CupertinoPageRoute(
          builder: (_) => const OrdersScreen(),
          settings: settings,
        );
      case profile:
        return CupertinoPageRoute(
          builder: (_) => const ProfileScreen(),
          settings: settings,
        );
      default:
        return CupertinoPageRoute(
          builder: (_) => const CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text('Fehler'),
            ),
            child: Center(
              child: Text('Seite nicht gefunden'),
            ),
          ),
        );
    }
  }
}