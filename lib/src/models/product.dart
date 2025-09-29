import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
@HiveType(typeId: 0)
class Product with _$Product {
  const factory Product({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required String description,
    @HiveField(3) required double price,
    @HiveField(4) required double originalPrice,
    @HiveField(5) required List<String> imageUrls,
    @HiveField(6) required String category,
    @HiveField(7) required String brand,
    @HiveField(8) required bool isAvailable,
    @HiveField(9) required double rating,
    @HiveField(10) required int reviewCount,
    @HiveField(11) required String unit,
    @HiveField(12) required double unitSize,
    @HiveField(13) required List<String> tags,
    @HiveField(14) required String nutritionGrade,
    @HiveField(15) required Map<String, String> nutritionFacts,
    @HiveField(16) required List<ProductVariant> variants,
    @HiveField(17) required bool hasOffer,
    @HiveField(18) String? offerText,
    @HiveField(19) DateTime? offerValidUntil,
    @HiveField(20) required bool isOrganic,
    @HiveField(21) required bool isVegan,
    @HiveField(22) required bool isVegetarian,
    @HiveField(23) required bool isGlutenFree,
    @HiveField(24) required bool isLactoseFree,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}

@freezed
@HiveType(typeId: 1)
class ProductVariant with _$ProductVariant {
  const factory ProductVariant({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) required double price,
    @HiveField(3) required bool isAvailable,
    @HiveField(4) required String type,
  }) = _ProductVariant;

  factory ProductVariant.fromJson(Map<String, dynamic> json) => _$ProductVariantFromJson(json);
}

@freezed
class CartItem with _$CartItem {
  const factory CartItem({
    required String productId,
    required String variantId,
    required int quantity,
    required double price,
    required String name,
    required String imageUrl,
    String? specialOffer,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    required String id,
    required String name,
    required String imageUrl,
    required String iconUrl,
    required int productCount,
    required bool isPopular,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}

@freezed
class Order with _$Order {
  const factory Order({
    required String id,
    required String status,
    required DateTime orderDate,
    required DateTime? deliveryDate,
    required double total,
    required double subtotal,
    required double deliveryFee,
    required double discount,
    required List<CartItem> items,
    required DeliveryAddress address,
    required PaymentMethod paymentMethod,
    String? trackingNumber,
    String? deliverySlot,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

@freezed
class DeliveryAddress with _$DeliveryAddress {
  const factory DeliveryAddress({
    required String id,
    required String label,
    required String street,
    required String houseNumber,
    required String postalCode,
    required String city,
    String? additionalInfo,
    required bool isDefault,
    required double latitude,
    required double longitude,
  }) = _DeliveryAddress;

  factory DeliveryAddress.fromJson(Map<String, dynamic> json) => _$DeliveryAddressFromJson(json);
}

@freezed
class PaymentMethod with _$PaymentMethod {
  const factory PaymentMethod({
    required String id,
    required String type,
    required String displayName,
    required String maskedNumber,
    required bool isDefault,
    String? expiryMonth,
    String? expiryYear,
  }) = _PaymentMethod;

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => _$PaymentMethodFromJson(json);
}