import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hive/hive.dart';

import '../models/product.dart';
import '../core/cache/hive_setup.dart';

final productCatalogProvider = AsyncNotifierProvider<ProductCatalogNotifier, List<Product>>(() {
  return ProductCatalogNotifier();
});

class ProductCatalogNotifier extends AsyncNotifier<List<Product>> {
  static const String _cacheKey = 'cached_products';
  static const String _fixturePath = 'assets/fixtures/products.json';

  @override
  Future<List<Product>> build() async {
    return await _loadProducts();
  }

  Future<List<Product>> _loadProducts() async {
    try {
      // Try to load from fixture first
      final products = await _loadFromFixture();
      
      // Cache the products in Hive
      await _cacheProducts(products);
      
      return products;
    } catch (e) {
      print('Error loading from fixture: $e');
      // Fallback to cached products
      return await _loadFromCache();
    }
  }

  Future<List<Product>> _loadFromFixture() async {
    try {
      final String jsonString = await rootBundle.loadString(_fixturePath);
      final List<dynamic> jsonList = json.decode(jsonString);
      
      return jsonList.map((json) => _parseProductFromFixture(json)).toList();
    } catch (e) {
      throw Exception('Failed to load products from fixture: $e');
    }
  }

  Product _parseProductFromFixture(Map<String, dynamic> json) {
    // Convert fixture format to Product model format
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      originalPrice: json['sale_price'] != null 
          ? (json['price'] as num).toDouble() 
          : (json['price'] as num).toDouble(),
      imageUrls: (json['images'] as List<dynamic>).cast<String>(),
      category: (json['categories'] as List<dynamic>).first as String,
      brand: json['brand'] as String,
      isAvailable: true,
      rating: (json['rating'] as num).toDouble(),
      reviewCount: json['reviews_count'] as int,
      unit: json['unit'] as String,
      unitSize: _parseUnitSize(json['unit'] as String),
      tags: (json['categories'] as List<dynamic>).cast<String>(),
      nutritionGrade: 'A',
      nutritionFacts: const {},
      variants: (json['variants'] as List<dynamic>)
          .map((v) => ProductVariant(
                id: v['id'] as String,
                name: v['name'] as String,
                price: (v['price'] as num).toDouble(),
                isAvailable: v['is_available'] as bool,
                type: v['type'] as String,
              ))
          .toList(),
      hasOffer: json['sale_price'] != null,
      offerText: json['sale_price'] != null ? 'Angebot' : null,
      offerValidUntil: null,
      isOrganic: json['is_organic'] as bool,
      isVegan: false,
      isVegetarian: false,
      isGlutenFree: false,
      isLactoseFree: false,
    );
  }

  double _parseUnitSize(String unit) {
    final RegExp numberRegex = RegExp(r'(\d+(?:\.\d+)?)');
    final match = numberRegex.firstMatch(unit);
    if (match != null) {
      return double.parse(match.group(1)!);
    }
    return 1.0;
  }

  Future<void> _cacheProducts(List<Product> products) async {
    try {
      final box = HiveSetup.productsBox;
      
      // Clear existing cache
      await box.clear();
      
      // Cache individual products by ID
      for (final product in products) {
        await box.put(product.id, product);
      }
      
      // Cache the complete list
      final productsData = <String, dynamic>{};
      for (int i = 0; i < products.length; i++) {
        productsData[i.toString()] = products[i].toJson();
      }
      
      final miscBox = Hive.box('misc');
      await miscBox.put(_cacheKey, productsData);
    } catch (e) {
      // Log error but don't fail the operation
      print('Failed to cache products: $e');
    }
  }

  Future<List<Product>> _loadFromCache() async {
    try {
      final miscBox = Hive.box('misc');
      final cachedData = miscBox.get(_cacheKey);
      
      if (cachedData is Map) {
        final products = <Product>[];
        for (final entry in cachedData.entries) {
          try {
            final product = Product.fromJson(Map<String, dynamic>.from(entry.value));
            products.add(product);
          } catch (e) {
            print('Failed to parse cached product: $e');
          }
        }
        
        if (products.isNotEmpty) {
          return products;
        }
      }
      
      // If no cached data, return empty list
      return [];
    } catch (e) {
      print('Failed to load cached products: $e');
      return [];
    }
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _loadProducts());
  }
}
