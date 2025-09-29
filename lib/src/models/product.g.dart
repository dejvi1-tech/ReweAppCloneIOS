// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 0;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product(
      id: fields[0] as String,
      name: fields[1] as String,
      description: fields[2] as String,
      price: fields[3] as double,
      originalPrice: fields[4] as double,
      imageUrls: (fields[5] as List).cast<String>(),
      category: fields[6] as String,
      brand: fields[7] as String,
      isAvailable: fields[8] as bool,
      rating: fields[9] as double,
      reviewCount: fields[10] as int,
      unit: fields[11] as String,
      unitSize: fields[12] as double,
      tags: (fields[13] as List).cast<String>(),
      nutritionGrade: fields[14] as String,
      nutritionFacts: (fields[15] as Map).cast<String, String>(),
      variants: (fields[16] as List).cast<ProductVariant>(),
      hasOffer: fields[17] as bool,
      offerText: fields[18] as String?,
      offerValidUntil: fields[19] as DateTime?,
      isOrganic: fields[20] as bool,
      isVegan: fields[21] as bool,
      isVegetarian: fields[22] as bool,
      isGlutenFree: fields[23] as bool,
      isLactoseFree: fields[24] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(25)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.originalPrice)
      ..writeByte(5)
      ..write(obj.imageUrls)
      ..writeByte(6)
      ..write(obj.category)
      ..writeByte(7)
      ..write(obj.brand)
      ..writeByte(8)
      ..write(obj.isAvailable)
      ..writeByte(9)
      ..write(obj.rating)
      ..writeByte(10)
      ..write(obj.reviewCount)
      ..writeByte(11)
      ..write(obj.unit)
      ..writeByte(12)
      ..write(obj.unitSize)
      ..writeByte(13)
      ..write(obj.tags)
      ..writeByte(14)
      ..write(obj.nutritionGrade)
      ..writeByte(15)
      ..write(obj.nutritionFacts)
      ..writeByte(16)
      ..write(obj.variants)
      ..writeByte(17)
      ..write(obj.hasOffer)
      ..writeByte(18)
      ..write(obj.offerText)
      ..writeByte(19)
      ..write(obj.offerValidUntil)
      ..writeByte(20)
      ..write(obj.isOrganic)
      ..writeByte(21)
      ..write(obj.isVegan)
      ..writeByte(22)
      ..write(obj.isVegetarian)
      ..writeByte(23)
      ..write(obj.isGlutenFree)
      ..writeByte(24)
      ..write(obj.isLactoseFree);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProductVariantAdapter extends TypeAdapter<ProductVariant> {
  @override
  final int typeId = 1;

  @override
  ProductVariant read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductVariant(
      id: fields[0] as String,
      name: fields[1] as String,
      price: fields[2] as double,
      isAvailable: fields[3] as bool,
      type: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProductVariant obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.isAvailable)
      ..writeByte(4)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductVariantAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      originalPrice: (json['originalPrice'] as num).toDouble(),
      imageUrls:
          (json['imageUrls'] as List<dynamic>).map((e) => e as String).toList(),
      category: json['category'] as String,
      brand: json['brand'] as String,
      isAvailable: json['isAvailable'] as bool,
      rating: (json['rating'] as num).toDouble(),
      reviewCount: (json['reviewCount'] as num).toInt(),
      unit: json['unit'] as String,
      unitSize: (json['unitSize'] as num).toDouble(),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      nutritionGrade: json['nutritionGrade'] as String,
      nutritionFacts: Map<String, String>.from(json['nutritionFacts'] as Map),
      variants: (json['variants'] as List<dynamic>)
          .map((e) => ProductVariant.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasOffer: json['hasOffer'] as bool,
      offerText: json['offerText'] as String?,
      offerValidUntil: json['offerValidUntil'] == null
          ? null
          : DateTime.parse(json['offerValidUntil'] as String),
      isOrganic: json['isOrganic'] as bool,
      isVegan: json['isVegan'] as bool,
      isVegetarian: json['isVegetarian'] as bool,
      isGlutenFree: json['isGlutenFree'] as bool,
      isLactoseFree: json['isLactoseFree'] as bool,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'originalPrice': instance.originalPrice,
      'imageUrls': instance.imageUrls,
      'category': instance.category,
      'brand': instance.brand,
      'isAvailable': instance.isAvailable,
      'rating': instance.rating,
      'reviewCount': instance.reviewCount,
      'unit': instance.unit,
      'unitSize': instance.unitSize,
      'tags': instance.tags,
      'nutritionGrade': instance.nutritionGrade,
      'nutritionFacts': instance.nutritionFacts,
      'variants': instance.variants,
      'hasOffer': instance.hasOffer,
      'offerText': instance.offerText,
      'offerValidUntil': instance.offerValidUntil?.toIso8601String(),
      'isOrganic': instance.isOrganic,
      'isVegan': instance.isVegan,
      'isVegetarian': instance.isVegetarian,
      'isGlutenFree': instance.isGlutenFree,
      'isLactoseFree': instance.isLactoseFree,
    };

_$ProductVariantImpl _$$ProductVariantImplFromJson(Map<String, dynamic> json) =>
    _$ProductVariantImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      isAvailable: json['isAvailable'] as bool,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$ProductVariantImplToJson(
        _$ProductVariantImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'isAvailable': instance.isAvailable,
      'type': instance.type,
    };

_$CartItemImpl _$$CartItemImplFromJson(Map<String, dynamic> json) =>
    _$CartItemImpl(
      productId: json['productId'] as String,
      variantId: json['variantId'] as String,
      quantity: (json['quantity'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      specialOffer: json['specialOffer'] as String?,
    );

Map<String, dynamic> _$$CartItemImplToJson(_$CartItemImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'variantId': instance.variantId,
      'quantity': instance.quantity,
      'price': instance.price,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'specialOffer': instance.specialOffer,
    };

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      iconUrl: json['iconUrl'] as String,
      productCount: (json['productCount'] as num).toInt(),
      isPopular: json['isPopular'] as bool,
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'iconUrl': instance.iconUrl,
      'productCount': instance.productCount,
      'isPopular': instance.isPopular,
    };

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      id: json['id'] as String,
      status: json['status'] as String,
      orderDate: DateTime.parse(json['orderDate'] as String),
      deliveryDate: json['deliveryDate'] == null
          ? null
          : DateTime.parse(json['deliveryDate'] as String),
      total: (json['total'] as num).toDouble(),
      subtotal: (json['subtotal'] as num).toDouble(),
      deliveryFee: (json['deliveryFee'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      items: (json['items'] as List<dynamic>)
          .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      address:
          DeliveryAddress.fromJson(json['address'] as Map<String, dynamic>),
      paymentMethod:
          PaymentMethod.fromJson(json['paymentMethod'] as Map<String, dynamic>),
      trackingNumber: json['trackingNumber'] as String?,
      deliverySlot: json['deliverySlot'] as String?,
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'orderDate': instance.orderDate.toIso8601String(),
      'deliveryDate': instance.deliveryDate?.toIso8601String(),
      'total': instance.total,
      'subtotal': instance.subtotal,
      'deliveryFee': instance.deliveryFee,
      'discount': instance.discount,
      'items': instance.items,
      'address': instance.address,
      'paymentMethod': instance.paymentMethod,
      'trackingNumber': instance.trackingNumber,
      'deliverySlot': instance.deliverySlot,
    };

_$DeliveryAddressImpl _$$DeliveryAddressImplFromJson(
        Map<String, dynamic> json) =>
    _$DeliveryAddressImpl(
      id: json['id'] as String,
      label: json['label'] as String,
      street: json['street'] as String,
      houseNumber: json['houseNumber'] as String,
      postalCode: json['postalCode'] as String,
      city: json['city'] as String,
      additionalInfo: json['additionalInfo'] as String?,
      isDefault: json['isDefault'] as bool,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$DeliveryAddressImplToJson(
        _$DeliveryAddressImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'street': instance.street,
      'houseNumber': instance.houseNumber,
      'postalCode': instance.postalCode,
      'city': instance.city,
      'additionalInfo': instance.additionalInfo,
      'isDefault': instance.isDefault,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

_$PaymentMethodImpl _$$PaymentMethodImplFromJson(Map<String, dynamic> json) =>
    _$PaymentMethodImpl(
      id: json['id'] as String,
      type: json['type'] as String,
      displayName: json['displayName'] as String,
      maskedNumber: json['maskedNumber'] as String,
      isDefault: json['isDefault'] as bool,
      expiryMonth: json['expiryMonth'] as String?,
      expiryYear: json['expiryYear'] as String?,
    );

Map<String, dynamic> _$$PaymentMethodImplToJson(_$PaymentMethodImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'displayName': instance.displayName,
      'maskedNumber': instance.maskedNumber,
      'isDefault': instance.isDefault,
      'expiryMonth': instance.expiryMonth,
      'expiryYear': instance.expiryYear,
    };
