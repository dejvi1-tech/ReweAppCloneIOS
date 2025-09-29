import 'package:hive_flutter/hive_flutter.dart';

import '../../models/product.dart';
import '../../models/user.dart';

class HiveSetup {
  static const String productsBoxName = 'products';
  static const String userBoxName = 'user';
  static const String cartBoxName = 'cart';
  static const String addressesBoxName = 'addresses';

  static Future<void> initialize() async {
    Hive.registerAdapter(ProductAdapter());
    Hive.registerAdapter(ProductVariantAdapter());
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(UserPreferencesAdapter());
    Hive.registerAdapter(UserLoyaltyAdapter());

    await Hive.openBox<Product>(productsBoxName);
    await Hive.openBox<User>(userBoxName);
    await Hive.openBox(cartBoxName);
    await Hive.openBox(addressesBoxName);
  }

  static Box<Product> get productsBox => Hive.box<Product>(productsBoxName);
  static Box<User> get userBox => Hive.box<User>(userBoxName);
  static Box get cartBox => Hive.box(cartBoxName);
  static Box get addressesBox => Hive.box(addressesBoxName);

  static Future<void> clearAll() async {
    await productsBox.clear();
    await userBox.clear();
    await cartBox.clear();
    await addressesBox.clear();
  }
}