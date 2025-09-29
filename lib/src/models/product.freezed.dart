// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String get description => throw _privateConstructorUsedError;
  @HiveField(3)
  double get price => throw _privateConstructorUsedError;
  @HiveField(4)
  double get originalPrice => throw _privateConstructorUsedError;
  @HiveField(5)
  List<String> get imageUrls => throw _privateConstructorUsedError;
  @HiveField(6)
  String get category => throw _privateConstructorUsedError;
  @HiveField(7)
  String get brand => throw _privateConstructorUsedError;
  @HiveField(8)
  bool get isAvailable => throw _privateConstructorUsedError;
  @HiveField(9)
  double get rating => throw _privateConstructorUsedError;
  @HiveField(10)
  int get reviewCount => throw _privateConstructorUsedError;
  @HiveField(11)
  String get unit => throw _privateConstructorUsedError;
  @HiveField(12)
  double get unitSize => throw _privateConstructorUsedError;
  @HiveField(13)
  List<String> get tags => throw _privateConstructorUsedError;
  @HiveField(14)
  String get nutritionGrade => throw _privateConstructorUsedError;
  @HiveField(15)
  Map<String, String> get nutritionFacts => throw _privateConstructorUsedError;
  @HiveField(16)
  List<ProductVariant> get variants => throw _privateConstructorUsedError;
  @HiveField(17)
  bool get hasOffer => throw _privateConstructorUsedError;
  @HiveField(18)
  String? get offerText => throw _privateConstructorUsedError;
  @HiveField(19)
  DateTime? get offerValidUntil => throw _privateConstructorUsedError;
  @HiveField(20)
  bool get isOrganic => throw _privateConstructorUsedError;
  @HiveField(21)
  bool get isVegan => throw _privateConstructorUsedError;
  @HiveField(22)
  bool get isVegetarian => throw _privateConstructorUsedError;
  @HiveField(23)
  bool get isGlutenFree => throw _privateConstructorUsedError;
  @HiveField(24)
  bool get isLactoseFree => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String description,
      @HiveField(3) double price,
      @HiveField(4) double originalPrice,
      @HiveField(5) List<String> imageUrls,
      @HiveField(6) String category,
      @HiveField(7) String brand,
      @HiveField(8) bool isAvailable,
      @HiveField(9) double rating,
      @HiveField(10) int reviewCount,
      @HiveField(11) String unit,
      @HiveField(12) double unitSize,
      @HiveField(13) List<String> tags,
      @HiveField(14) String nutritionGrade,
      @HiveField(15) Map<String, String> nutritionFacts,
      @HiveField(16) List<ProductVariant> variants,
      @HiveField(17) bool hasOffer,
      @HiveField(18) String? offerText,
      @HiveField(19) DateTime? offerValidUntil,
      @HiveField(20) bool isOrganic,
      @HiveField(21) bool isVegan,
      @HiveField(22) bool isVegetarian,
      @HiveField(23) bool isGlutenFree,
      @HiveField(24) bool isLactoseFree});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? originalPrice = null,
    Object? imageUrls = null,
    Object? category = null,
    Object? brand = null,
    Object? isAvailable = null,
    Object? rating = null,
    Object? reviewCount = null,
    Object? unit = null,
    Object? unitSize = null,
    Object? tags = null,
    Object? nutritionGrade = null,
    Object? nutritionFacts = null,
    Object? variants = null,
    Object? hasOffer = null,
    Object? offerText = freezed,
    Object? offerValidUntil = freezed,
    Object? isOrganic = null,
    Object? isVegan = null,
    Object? isVegetarian = null,
    Object? isGlutenFree = null,
    Object? isLactoseFree = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      originalPrice: null == originalPrice
          ? _value.originalPrice
          : originalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      imageUrls: null == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      unitSize: null == unitSize
          ? _value.unitSize
          : unitSize // ignore: cast_nullable_to_non_nullable
              as double,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nutritionGrade: null == nutritionGrade
          ? _value.nutritionGrade
          : nutritionGrade // ignore: cast_nullable_to_non_nullable
              as String,
      nutritionFacts: null == nutritionFacts
          ? _value.nutritionFacts
          : nutritionFacts // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      variants: null == variants
          ? _value.variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<ProductVariant>,
      hasOffer: null == hasOffer
          ? _value.hasOffer
          : hasOffer // ignore: cast_nullable_to_non_nullable
              as bool,
      offerText: freezed == offerText
          ? _value.offerText
          : offerText // ignore: cast_nullable_to_non_nullable
              as String?,
      offerValidUntil: freezed == offerValidUntil
          ? _value.offerValidUntil
          : offerValidUntil // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isOrganic: null == isOrganic
          ? _value.isOrganic
          : isOrganic // ignore: cast_nullable_to_non_nullable
              as bool,
      isVegan: null == isVegan
          ? _value.isVegan
          : isVegan // ignore: cast_nullable_to_non_nullable
              as bool,
      isVegetarian: null == isVegetarian
          ? _value.isVegetarian
          : isVegetarian // ignore: cast_nullable_to_non_nullable
              as bool,
      isGlutenFree: null == isGlutenFree
          ? _value.isGlutenFree
          : isGlutenFree // ignore: cast_nullable_to_non_nullable
              as bool,
      isLactoseFree: null == isLactoseFree
          ? _value.isLactoseFree
          : isLactoseFree // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String description,
      @HiveField(3) double price,
      @HiveField(4) double originalPrice,
      @HiveField(5) List<String> imageUrls,
      @HiveField(6) String category,
      @HiveField(7) String brand,
      @HiveField(8) bool isAvailable,
      @HiveField(9) double rating,
      @HiveField(10) int reviewCount,
      @HiveField(11) String unit,
      @HiveField(12) double unitSize,
      @HiveField(13) List<String> tags,
      @HiveField(14) String nutritionGrade,
      @HiveField(15) Map<String, String> nutritionFacts,
      @HiveField(16) List<ProductVariant> variants,
      @HiveField(17) bool hasOffer,
      @HiveField(18) String? offerText,
      @HiveField(19) DateTime? offerValidUntil,
      @HiveField(20) bool isOrganic,
      @HiveField(21) bool isVegan,
      @HiveField(22) bool isVegetarian,
      @HiveField(23) bool isGlutenFree,
      @HiveField(24) bool isLactoseFree});
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? price = null,
    Object? originalPrice = null,
    Object? imageUrls = null,
    Object? category = null,
    Object? brand = null,
    Object? isAvailable = null,
    Object? rating = null,
    Object? reviewCount = null,
    Object? unit = null,
    Object? unitSize = null,
    Object? tags = null,
    Object? nutritionGrade = null,
    Object? nutritionFacts = null,
    Object? variants = null,
    Object? hasOffer = null,
    Object? offerText = freezed,
    Object? offerValidUntil = freezed,
    Object? isOrganic = null,
    Object? isVegan = null,
    Object? isVegetarian = null,
    Object? isGlutenFree = null,
    Object? isLactoseFree = null,
  }) {
    return _then(_$ProductImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      originalPrice: null == originalPrice
          ? _value.originalPrice
          : originalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      imageUrls: null == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      reviewCount: null == reviewCount
          ? _value.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      unitSize: null == unitSize
          ? _value.unitSize
          : unitSize // ignore: cast_nullable_to_non_nullable
              as double,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nutritionGrade: null == nutritionGrade
          ? _value.nutritionGrade
          : nutritionGrade // ignore: cast_nullable_to_non_nullable
              as String,
      nutritionFacts: null == nutritionFacts
          ? _value._nutritionFacts
          : nutritionFacts // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      variants: null == variants
          ? _value._variants
          : variants // ignore: cast_nullable_to_non_nullable
              as List<ProductVariant>,
      hasOffer: null == hasOffer
          ? _value.hasOffer
          : hasOffer // ignore: cast_nullable_to_non_nullable
              as bool,
      offerText: freezed == offerText
          ? _value.offerText
          : offerText // ignore: cast_nullable_to_non_nullable
              as String?,
      offerValidUntil: freezed == offerValidUntil
          ? _value.offerValidUntil
          : offerValidUntil // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isOrganic: null == isOrganic
          ? _value.isOrganic
          : isOrganic // ignore: cast_nullable_to_non_nullable
              as bool,
      isVegan: null == isVegan
          ? _value.isVegan
          : isVegan // ignore: cast_nullable_to_non_nullable
              as bool,
      isVegetarian: null == isVegetarian
          ? _value.isVegetarian
          : isVegetarian // ignore: cast_nullable_to_non_nullable
              as bool,
      isGlutenFree: null == isGlutenFree
          ? _value.isGlutenFree
          : isGlutenFree // ignore: cast_nullable_to_non_nullable
              as bool,
      isLactoseFree: null == isLactoseFree
          ? _value.isLactoseFree
          : isLactoseFree // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl implements _Product {
  const _$ProductImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.description,
      @HiveField(3) required this.price,
      @HiveField(4) required this.originalPrice,
      @HiveField(5) required final List<String> imageUrls,
      @HiveField(6) required this.category,
      @HiveField(7) required this.brand,
      @HiveField(8) required this.isAvailable,
      @HiveField(9) required this.rating,
      @HiveField(10) required this.reviewCount,
      @HiveField(11) required this.unit,
      @HiveField(12) required this.unitSize,
      @HiveField(13) required final List<String> tags,
      @HiveField(14) required this.nutritionGrade,
      @HiveField(15) required final Map<String, String> nutritionFacts,
      @HiveField(16) required final List<ProductVariant> variants,
      @HiveField(17) required this.hasOffer,
      @HiveField(18) this.offerText,
      @HiveField(19) this.offerValidUntil,
      @HiveField(20) required this.isOrganic,
      @HiveField(21) required this.isVegan,
      @HiveField(22) required this.isVegetarian,
      @HiveField(23) required this.isGlutenFree,
      @HiveField(24) required this.isLactoseFree})
      : _imageUrls = imageUrls,
        _tags = tags,
        _nutritionFacts = nutritionFacts,
        _variants = variants;

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String description;
  @override
  @HiveField(3)
  final double price;
  @override
  @HiveField(4)
  final double originalPrice;
  final List<String> _imageUrls;
  @override
  @HiveField(5)
  List<String> get imageUrls {
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrls);
  }

  @override
  @HiveField(6)
  final String category;
  @override
  @HiveField(7)
  final String brand;
  @override
  @HiveField(8)
  final bool isAvailable;
  @override
  @HiveField(9)
  final double rating;
  @override
  @HiveField(10)
  final int reviewCount;
  @override
  @HiveField(11)
  final String unit;
  @override
  @HiveField(12)
  final double unitSize;
  final List<String> _tags;
  @override
  @HiveField(13)
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  @HiveField(14)
  final String nutritionGrade;
  final Map<String, String> _nutritionFacts;
  @override
  @HiveField(15)
  Map<String, String> get nutritionFacts {
    if (_nutritionFacts is EqualUnmodifiableMapView) return _nutritionFacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_nutritionFacts);
  }

  final List<ProductVariant> _variants;
  @override
  @HiveField(16)
  List<ProductVariant> get variants {
    if (_variants is EqualUnmodifiableListView) return _variants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_variants);
  }

  @override
  @HiveField(17)
  final bool hasOffer;
  @override
  @HiveField(18)
  final String? offerText;
  @override
  @HiveField(19)
  final DateTime? offerValidUntil;
  @override
  @HiveField(20)
  final bool isOrganic;
  @override
  @HiveField(21)
  final bool isVegan;
  @override
  @HiveField(22)
  final bool isVegetarian;
  @override
  @HiveField(23)
  final bool isGlutenFree;
  @override
  @HiveField(24)
  final bool isLactoseFree;

  @override
  String toString() {
    return 'Product(id: $id, name: $name, description: $description, price: $price, originalPrice: $originalPrice, imageUrls: $imageUrls, category: $category, brand: $brand, isAvailable: $isAvailable, rating: $rating, reviewCount: $reviewCount, unit: $unit, unitSize: $unitSize, tags: $tags, nutritionGrade: $nutritionGrade, nutritionFacts: $nutritionFacts, variants: $variants, hasOffer: $hasOffer, offerText: $offerText, offerValidUntil: $offerValidUntil, isOrganic: $isOrganic, isVegan: $isVegan, isVegetarian: $isVegetarian, isGlutenFree: $isGlutenFree, isLactoseFree: $isLactoseFree)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.originalPrice, originalPrice) ||
                other.originalPrice == originalPrice) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.unitSize, unitSize) ||
                other.unitSize == unitSize) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.nutritionGrade, nutritionGrade) ||
                other.nutritionGrade == nutritionGrade) &&
            const DeepCollectionEquality()
                .equals(other._nutritionFacts, _nutritionFacts) &&
            const DeepCollectionEquality().equals(other._variants, _variants) &&
            (identical(other.hasOffer, hasOffer) ||
                other.hasOffer == hasOffer) &&
            (identical(other.offerText, offerText) ||
                other.offerText == offerText) &&
            (identical(other.offerValidUntil, offerValidUntil) ||
                other.offerValidUntil == offerValidUntil) &&
            (identical(other.isOrganic, isOrganic) ||
                other.isOrganic == isOrganic) &&
            (identical(other.isVegan, isVegan) || other.isVegan == isVegan) &&
            (identical(other.isVegetarian, isVegetarian) ||
                other.isVegetarian == isVegetarian) &&
            (identical(other.isGlutenFree, isGlutenFree) ||
                other.isGlutenFree == isGlutenFree) &&
            (identical(other.isLactoseFree, isLactoseFree) ||
                other.isLactoseFree == isLactoseFree));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        description,
        price,
        originalPrice,
        const DeepCollectionEquality().hash(_imageUrls),
        category,
        brand,
        isAvailable,
        rating,
        reviewCount,
        unit,
        unitSize,
        const DeepCollectionEquality().hash(_tags),
        nutritionGrade,
        const DeepCollectionEquality().hash(_nutritionFacts),
        const DeepCollectionEquality().hash(_variants),
        hasOffer,
        offerText,
        offerValidUntil,
        isOrganic,
        isVegan,
        isVegetarian,
        isGlutenFree,
        isLactoseFree
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product implements Product {
  const factory _Product(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String name,
      @HiveField(2) required final String description,
      @HiveField(3) required final double price,
      @HiveField(4) required final double originalPrice,
      @HiveField(5) required final List<String> imageUrls,
      @HiveField(6) required final String category,
      @HiveField(7) required final String brand,
      @HiveField(8) required final bool isAvailable,
      @HiveField(9) required final double rating,
      @HiveField(10) required final int reviewCount,
      @HiveField(11) required final String unit,
      @HiveField(12) required final double unitSize,
      @HiveField(13) required final List<String> tags,
      @HiveField(14) required final String nutritionGrade,
      @HiveField(15) required final Map<String, String> nutritionFacts,
      @HiveField(16) required final List<ProductVariant> variants,
      @HiveField(17) required final bool hasOffer,
      @HiveField(18) final String? offerText,
      @HiveField(19) final DateTime? offerValidUntil,
      @HiveField(20) required final bool isOrganic,
      @HiveField(21) required final bool isVegan,
      @HiveField(22) required final bool isVegetarian,
      @HiveField(23) required final bool isGlutenFree,
      @HiveField(24) required final bool isLactoseFree}) = _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String get description;
  @override
  @HiveField(3)
  double get price;
  @override
  @HiveField(4)
  double get originalPrice;
  @override
  @HiveField(5)
  List<String> get imageUrls;
  @override
  @HiveField(6)
  String get category;
  @override
  @HiveField(7)
  String get brand;
  @override
  @HiveField(8)
  bool get isAvailable;
  @override
  @HiveField(9)
  double get rating;
  @override
  @HiveField(10)
  int get reviewCount;
  @override
  @HiveField(11)
  String get unit;
  @override
  @HiveField(12)
  double get unitSize;
  @override
  @HiveField(13)
  List<String> get tags;
  @override
  @HiveField(14)
  String get nutritionGrade;
  @override
  @HiveField(15)
  Map<String, String> get nutritionFacts;
  @override
  @HiveField(16)
  List<ProductVariant> get variants;
  @override
  @HiveField(17)
  bool get hasOffer;
  @override
  @HiveField(18)
  String? get offerText;
  @override
  @HiveField(19)
  DateTime? get offerValidUntil;
  @override
  @HiveField(20)
  bool get isOrganic;
  @override
  @HiveField(21)
  bool get isVegan;
  @override
  @HiveField(22)
  bool get isVegetarian;
  @override
  @HiveField(23)
  bool get isGlutenFree;
  @override
  @HiveField(24)
  bool get isLactoseFree;
  @override
  @JsonKey(ignore: true)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductVariant _$ProductVariantFromJson(Map<String, dynamic> json) {
  return _ProductVariant.fromJson(json);
}

/// @nodoc
mixin _$ProductVariant {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  double get price => throw _privateConstructorUsedError;
  @HiveField(3)
  bool get isAvailable => throw _privateConstructorUsedError;
  @HiveField(4)
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductVariantCopyWith<ProductVariant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductVariantCopyWith<$Res> {
  factory $ProductVariantCopyWith(
          ProductVariant value, $Res Function(ProductVariant) then) =
      _$ProductVariantCopyWithImpl<$Res, ProductVariant>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) double price,
      @HiveField(3) bool isAvailable,
      @HiveField(4) String type});
}

/// @nodoc
class _$ProductVariantCopyWithImpl<$Res, $Val extends ProductVariant>
    implements $ProductVariantCopyWith<$Res> {
  _$ProductVariantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? isAvailable = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductVariantImplCopyWith<$Res>
    implements $ProductVariantCopyWith<$Res> {
  factory _$$ProductVariantImplCopyWith(_$ProductVariantImpl value,
          $Res Function(_$ProductVariantImpl) then) =
      __$$ProductVariantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) double price,
      @HiveField(3) bool isAvailable,
      @HiveField(4) String type});
}

/// @nodoc
class __$$ProductVariantImplCopyWithImpl<$Res>
    extends _$ProductVariantCopyWithImpl<$Res, _$ProductVariantImpl>
    implements _$$ProductVariantImplCopyWith<$Res> {
  __$$ProductVariantImplCopyWithImpl(
      _$ProductVariantImpl _value, $Res Function(_$ProductVariantImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? isAvailable = null,
    Object? type = null,
  }) {
    return _then(_$ProductVariantImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductVariantImpl implements _ProductVariant {
  const _$ProductVariantImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.price,
      @HiveField(3) required this.isAvailable,
      @HiveField(4) required this.type});

  factory _$ProductVariantImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductVariantImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final double price;
  @override
  @HiveField(3)
  final bool isAvailable;
  @override
  @HiveField(4)
  final String type;

  @override
  String toString() {
    return 'ProductVariant(id: $id, name: $name, price: $price, isAvailable: $isAvailable, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductVariantImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, price, isAvailable, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductVariantImplCopyWith<_$ProductVariantImpl> get copyWith =>
      __$$ProductVariantImplCopyWithImpl<_$ProductVariantImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductVariantImplToJson(
      this,
    );
  }
}

abstract class _ProductVariant implements ProductVariant {
  const factory _ProductVariant(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String name,
      @HiveField(2) required final double price,
      @HiveField(3) required final bool isAvailable,
      @HiveField(4) required final String type}) = _$ProductVariantImpl;

  factory _ProductVariant.fromJson(Map<String, dynamic> json) =
      _$ProductVariantImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  double get price;
  @override
  @HiveField(3)
  bool get isAvailable;
  @override
  @HiveField(4)
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$ProductVariantImplCopyWith<_$ProductVariantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CartItem _$CartItemFromJson(Map<String, dynamic> json) {
  return _CartItem.fromJson(json);
}

/// @nodoc
mixin _$CartItem {
  String get productId => throw _privateConstructorUsedError;
  String get variantId => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String? get specialOffer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartItemCopyWith<CartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemCopyWith<$Res> {
  factory $CartItemCopyWith(CartItem value, $Res Function(CartItem) then) =
      _$CartItemCopyWithImpl<$Res, CartItem>;
  @useResult
  $Res call(
      {String productId,
      String variantId,
      int quantity,
      double price,
      String name,
      String imageUrl,
      String? specialOffer});
}

/// @nodoc
class _$CartItemCopyWithImpl<$Res, $Val extends CartItem>
    implements $CartItemCopyWith<$Res> {
  _$CartItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? variantId = null,
    Object? quantity = null,
    Object? price = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? specialOffer = freezed,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      variantId: null == variantId
          ? _value.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      specialOffer: freezed == specialOffer
          ? _value.specialOffer
          : specialOffer // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartItemImplCopyWith<$Res>
    implements $CartItemCopyWith<$Res> {
  factory _$$CartItemImplCopyWith(
          _$CartItemImpl value, $Res Function(_$CartItemImpl) then) =
      __$$CartItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String productId,
      String variantId,
      int quantity,
      double price,
      String name,
      String imageUrl,
      String? specialOffer});
}

/// @nodoc
class __$$CartItemImplCopyWithImpl<$Res>
    extends _$CartItemCopyWithImpl<$Res, _$CartItemImpl>
    implements _$$CartItemImplCopyWith<$Res> {
  __$$CartItemImplCopyWithImpl(
      _$CartItemImpl _value, $Res Function(_$CartItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? variantId = null,
    Object? quantity = null,
    Object? price = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? specialOffer = freezed,
  }) {
    return _then(_$CartItemImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      variantId: null == variantId
          ? _value.variantId
          : variantId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      specialOffer: freezed == specialOffer
          ? _value.specialOffer
          : specialOffer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CartItemImpl implements _CartItem {
  const _$CartItemImpl(
      {required this.productId,
      required this.variantId,
      required this.quantity,
      required this.price,
      required this.name,
      required this.imageUrl,
      this.specialOffer});

  factory _$CartItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartItemImplFromJson(json);

  @override
  final String productId;
  @override
  final String variantId;
  @override
  final int quantity;
  @override
  final double price;
  @override
  final String name;
  @override
  final String imageUrl;
  @override
  final String? specialOffer;

  @override
  String toString() {
    return 'CartItem(productId: $productId, variantId: $variantId, quantity: $quantity, price: $price, name: $name, imageUrl: $imageUrl, specialOffer: $specialOffer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartItemImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.variantId, variantId) ||
                other.variantId == variantId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.specialOffer, specialOffer) ||
                other.specialOffer == specialOffer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, productId, variantId, quantity,
      price, name, imageUrl, specialOffer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      __$$CartItemImplCopyWithImpl<_$CartItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartItemImplToJson(
      this,
    );
  }
}

abstract class _CartItem implements CartItem {
  const factory _CartItem(
      {required final String productId,
      required final String variantId,
      required final int quantity,
      required final double price,
      required final String name,
      required final String imageUrl,
      final String? specialOffer}) = _$CartItemImpl;

  factory _CartItem.fromJson(Map<String, dynamic> json) =
      _$CartItemImpl.fromJson;

  @override
  String get productId;
  @override
  String get variantId;
  @override
  int get quantity;
  @override
  double get price;
  @override
  String get name;
  @override
  String get imageUrl;
  @override
  String? get specialOffer;
  @override
  @JsonKey(ignore: true)
  _$$CartItemImplCopyWith<_$CartItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get iconUrl => throw _privateConstructorUsedError;
  int get productCount => throw _privateConstructorUsedError;
  bool get isPopular => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res, Category>;
  @useResult
  $Res call(
      {String id,
      String name,
      String imageUrl,
      String iconUrl,
      int productCount,
      bool isPopular});
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res, $Val extends Category>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? iconUrl = null,
    Object? productCount = null,
    Object? isPopular = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: null == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      productCount: null == productCount
          ? _value.productCount
          : productCount // ignore: cast_nullable_to_non_nullable
              as int,
      isPopular: null == isPopular
          ? _value.isPopular
          : isPopular // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryImplCopyWith<$Res>
    implements $CategoryCopyWith<$Res> {
  factory _$$CategoryImplCopyWith(
          _$CategoryImpl value, $Res Function(_$CategoryImpl) then) =
      __$$CategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String imageUrl,
      String iconUrl,
      int productCount,
      bool isPopular});
}

/// @nodoc
class __$$CategoryImplCopyWithImpl<$Res>
    extends _$CategoryCopyWithImpl<$Res, _$CategoryImpl>
    implements _$$CategoryImplCopyWith<$Res> {
  __$$CategoryImplCopyWithImpl(
      _$CategoryImpl _value, $Res Function(_$CategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? imageUrl = null,
    Object? iconUrl = null,
    Object? productCount = null,
    Object? isPopular = null,
  }) {
    return _then(_$CategoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: null == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String,
      productCount: null == productCount
          ? _value.productCount
          : productCount // ignore: cast_nullable_to_non_nullable
              as int,
      isPopular: null == isPopular
          ? _value.isPopular
          : isPopular // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryImpl implements _Category {
  const _$CategoryImpl(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.iconUrl,
      required this.productCount,
      required this.isPopular});

  factory _$CategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String imageUrl;
  @override
  final String iconUrl;
  @override
  final int productCount;
  @override
  final bool isPopular;

  @override
  String toString() {
    return 'Category(id: $id, name: $name, imageUrl: $imageUrl, iconUrl: $iconUrl, productCount: $productCount, isPopular: $isPopular)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            (identical(other.productCount, productCount) ||
                other.productCount == productCount) &&
            (identical(other.isPopular, isPopular) ||
                other.isPopular == isPopular));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, imageUrl, iconUrl, productCount, isPopular);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      __$$CategoryImplCopyWithImpl<_$CategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryImplToJson(
      this,
    );
  }
}

abstract class _Category implements Category {
  const factory _Category(
      {required final String id,
      required final String name,
      required final String imageUrl,
      required final String iconUrl,
      required final int productCount,
      required final bool isPopular}) = _$CategoryImpl;

  factory _Category.fromJson(Map<String, dynamic> json) =
      _$CategoryImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get imageUrl;
  @override
  String get iconUrl;
  @override
  int get productCount;
  @override
  bool get isPopular;
  @override
  @JsonKey(ignore: true)
  _$$CategoryImplCopyWith<_$CategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  String get id => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  DateTime get orderDate => throw _privateConstructorUsedError;
  DateTime? get deliveryDate => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  double get subtotal => throw _privateConstructorUsedError;
  double get deliveryFee => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;
  List<CartItem> get items => throw _privateConstructorUsedError;
  DeliveryAddress get address => throw _privateConstructorUsedError;
  PaymentMethod get paymentMethod => throw _privateConstructorUsedError;
  String? get trackingNumber => throw _privateConstructorUsedError;
  String? get deliverySlot => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {String id,
      String status,
      DateTime orderDate,
      DateTime? deliveryDate,
      double total,
      double subtotal,
      double deliveryFee,
      double discount,
      List<CartItem> items,
      DeliveryAddress address,
      PaymentMethod paymentMethod,
      String? trackingNumber,
      String? deliverySlot});

  $DeliveryAddressCopyWith<$Res> get address;
  $PaymentMethodCopyWith<$Res> get paymentMethod;
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? orderDate = null,
    Object? deliveryDate = freezed,
    Object? total = null,
    Object? subtotal = null,
    Object? deliveryFee = null,
    Object? discount = null,
    Object? items = null,
    Object? address = null,
    Object? paymentMethod = null,
    Object? trackingNumber = freezed,
    Object? deliverySlot = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as DeliveryAddress,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      trackingNumber: freezed == trackingNumber
          ? _value.trackingNumber
          : trackingNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      deliverySlot: freezed == deliverySlot
          ? _value.deliverySlot
          : deliverySlot // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DeliveryAddressCopyWith<$Res> get address {
    return $DeliveryAddressCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentMethodCopyWith<$Res> get paymentMethod {
    return $PaymentMethodCopyWith<$Res>(_value.paymentMethod, (value) {
      return _then(_value.copyWith(paymentMethod: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OrderImplCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$OrderImplCopyWith(
          _$OrderImpl value, $Res Function(_$OrderImpl) then) =
      __$$OrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String status,
      DateTime orderDate,
      DateTime? deliveryDate,
      double total,
      double subtotal,
      double deliveryFee,
      double discount,
      List<CartItem> items,
      DeliveryAddress address,
      PaymentMethod paymentMethod,
      String? trackingNumber,
      String? deliverySlot});

  @override
  $DeliveryAddressCopyWith<$Res> get address;
  @override
  $PaymentMethodCopyWith<$Res> get paymentMethod;
}

/// @nodoc
class __$$OrderImplCopyWithImpl<$Res>
    extends _$OrderCopyWithImpl<$Res, _$OrderImpl>
    implements _$$OrderImplCopyWith<$Res> {
  __$$OrderImplCopyWithImpl(
      _$OrderImpl _value, $Res Function(_$OrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? orderDate = null,
    Object? deliveryDate = freezed,
    Object? total = null,
    Object? subtotal = null,
    Object? deliveryFee = null,
    Object? discount = null,
    Object? items = null,
    Object? address = null,
    Object? paymentMethod = null,
    Object? trackingNumber = freezed,
    Object? deliverySlot = freezed,
  }) {
    return _then(_$OrderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      orderDate: null == orderDate
          ? _value.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryDate: freezed == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryFee: null == deliveryFee
          ? _value.deliveryFee
          : deliveryFee // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as DeliveryAddress,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod,
      trackingNumber: freezed == trackingNumber
          ? _value.trackingNumber
          : trackingNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      deliverySlot: freezed == deliverySlot
          ? _value.deliverySlot
          : deliverySlot // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderImpl implements _Order {
  const _$OrderImpl(
      {required this.id,
      required this.status,
      required this.orderDate,
      required this.deliveryDate,
      required this.total,
      required this.subtotal,
      required this.deliveryFee,
      required this.discount,
      required final List<CartItem> items,
      required this.address,
      required this.paymentMethod,
      this.trackingNumber,
      this.deliverySlot})
      : _items = items;

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  final String id;
  @override
  final String status;
  @override
  final DateTime orderDate;
  @override
  final DateTime? deliveryDate;
  @override
  final double total;
  @override
  final double subtotal;
  @override
  final double deliveryFee;
  @override
  final double discount;
  final List<CartItem> _items;
  @override
  List<CartItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final DeliveryAddress address;
  @override
  final PaymentMethod paymentMethod;
  @override
  final String? trackingNumber;
  @override
  final String? deliverySlot;

  @override
  String toString() {
    return 'Order(id: $id, status: $status, orderDate: $orderDate, deliveryDate: $deliveryDate, total: $total, subtotal: $subtotal, deliveryFee: $deliveryFee, discount: $discount, items: $items, address: $address, paymentMethod: $paymentMethod, trackingNumber: $trackingNumber, deliverySlot: $deliverySlot)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.deliveryFee, deliveryFee) ||
                other.deliveryFee == deliveryFee) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.trackingNumber, trackingNumber) ||
                other.trackingNumber == trackingNumber) &&
            (identical(other.deliverySlot, deliverySlot) ||
                other.deliverySlot == deliverySlot));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      status,
      orderDate,
      deliveryDate,
      total,
      subtotal,
      deliveryFee,
      discount,
      const DeepCollectionEquality().hash(_items),
      address,
      paymentMethod,
      trackingNumber,
      deliverySlot);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderImplToJson(
      this,
    );
  }
}

abstract class _Order implements Order {
  const factory _Order(
      {required final String id,
      required final String status,
      required final DateTime orderDate,
      required final DateTime? deliveryDate,
      required final double total,
      required final double subtotal,
      required final double deliveryFee,
      required final double discount,
      required final List<CartItem> items,
      required final DeliveryAddress address,
      required final PaymentMethod paymentMethod,
      final String? trackingNumber,
      final String? deliverySlot}) = _$OrderImpl;

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  String get id;
  @override
  String get status;
  @override
  DateTime get orderDate;
  @override
  DateTime? get deliveryDate;
  @override
  double get total;
  @override
  double get subtotal;
  @override
  double get deliveryFee;
  @override
  double get discount;
  @override
  List<CartItem> get items;
  @override
  DeliveryAddress get address;
  @override
  PaymentMethod get paymentMethod;
  @override
  String? get trackingNumber;
  @override
  String? get deliverySlot;
  @override
  @JsonKey(ignore: true)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DeliveryAddress _$DeliveryAddressFromJson(Map<String, dynamic> json) {
  return _DeliveryAddress.fromJson(json);
}

/// @nodoc
mixin _$DeliveryAddress {
  String get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  String get street => throw _privateConstructorUsedError;
  String get houseNumber => throw _privateConstructorUsedError;
  String get postalCode => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String? get additionalInfo => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeliveryAddressCopyWith<DeliveryAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryAddressCopyWith<$Res> {
  factory $DeliveryAddressCopyWith(
          DeliveryAddress value, $Res Function(DeliveryAddress) then) =
      _$DeliveryAddressCopyWithImpl<$Res, DeliveryAddress>;
  @useResult
  $Res call(
      {String id,
      String label,
      String street,
      String houseNumber,
      String postalCode,
      String city,
      String? additionalInfo,
      bool isDefault,
      double latitude,
      double longitude});
}

/// @nodoc
class _$DeliveryAddressCopyWithImpl<$Res, $Val extends DeliveryAddress>
    implements $DeliveryAddressCopyWith<$Res> {
  _$DeliveryAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? street = null,
    Object? houseNumber = null,
    Object? postalCode = null,
    Object? city = null,
    Object? additionalInfo = freezed,
    Object? isDefault = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      houseNumber: null == houseNumber
          ? _value.houseNumber
          : houseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      additionalInfo: freezed == additionalInfo
          ? _value.additionalInfo
          : additionalInfo // ignore: cast_nullable_to_non_nullable
              as String?,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeliveryAddressImplCopyWith<$Res>
    implements $DeliveryAddressCopyWith<$Res> {
  factory _$$DeliveryAddressImplCopyWith(_$DeliveryAddressImpl value,
          $Res Function(_$DeliveryAddressImpl) then) =
      __$$DeliveryAddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String label,
      String street,
      String houseNumber,
      String postalCode,
      String city,
      String? additionalInfo,
      bool isDefault,
      double latitude,
      double longitude});
}

/// @nodoc
class __$$DeliveryAddressImplCopyWithImpl<$Res>
    extends _$DeliveryAddressCopyWithImpl<$Res, _$DeliveryAddressImpl>
    implements _$$DeliveryAddressImplCopyWith<$Res> {
  __$$DeliveryAddressImplCopyWithImpl(
      _$DeliveryAddressImpl _value, $Res Function(_$DeliveryAddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? street = null,
    Object? houseNumber = null,
    Object? postalCode = null,
    Object? city = null,
    Object? additionalInfo = freezed,
    Object? isDefault = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$DeliveryAddressImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      houseNumber: null == houseNumber
          ? _value.houseNumber
          : houseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      additionalInfo: freezed == additionalInfo
          ? _value.additionalInfo
          : additionalInfo // ignore: cast_nullable_to_non_nullable
              as String?,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeliveryAddressImpl implements _DeliveryAddress {
  const _$DeliveryAddressImpl(
      {required this.id,
      required this.label,
      required this.street,
      required this.houseNumber,
      required this.postalCode,
      required this.city,
      this.additionalInfo,
      required this.isDefault,
      required this.latitude,
      required this.longitude});

  factory _$DeliveryAddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryAddressImplFromJson(json);

  @override
  final String id;
  @override
  final String label;
  @override
  final String street;
  @override
  final String houseNumber;
  @override
  final String postalCode;
  @override
  final String city;
  @override
  final String? additionalInfo;
  @override
  final bool isDefault;
  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'DeliveryAddress(id: $id, label: $label, street: $street, houseNumber: $houseNumber, postalCode: $postalCode, city: $city, additionalInfo: $additionalInfo, isDefault: $isDefault, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryAddressImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.houseNumber, houseNumber) ||
                other.houseNumber == houseNumber) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.additionalInfo, additionalInfo) ||
                other.additionalInfo == additionalInfo) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, label, street, houseNumber,
      postalCode, city, additionalInfo, isDefault, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryAddressImplCopyWith<_$DeliveryAddressImpl> get copyWith =>
      __$$DeliveryAddressImplCopyWithImpl<_$DeliveryAddressImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryAddressImplToJson(
      this,
    );
  }
}

abstract class _DeliveryAddress implements DeliveryAddress {
  const factory _DeliveryAddress(
      {required final String id,
      required final String label,
      required final String street,
      required final String houseNumber,
      required final String postalCode,
      required final String city,
      final String? additionalInfo,
      required final bool isDefault,
      required final double latitude,
      required final double longitude}) = _$DeliveryAddressImpl;

  factory _DeliveryAddress.fromJson(Map<String, dynamic> json) =
      _$DeliveryAddressImpl.fromJson;

  @override
  String get id;
  @override
  String get label;
  @override
  String get street;
  @override
  String get houseNumber;
  @override
  String get postalCode;
  @override
  String get city;
  @override
  String? get additionalInfo;
  @override
  bool get isDefault;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(ignore: true)
  _$$DeliveryAddressImplCopyWith<_$DeliveryAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) {
  return _PaymentMethod.fromJson(json);
}

/// @nodoc
mixin _$PaymentMethod {
  String get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String get maskedNumber => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;
  String? get expiryMonth => throw _privateConstructorUsedError;
  String? get expiryYear => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentMethodCopyWith<PaymentMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodCopyWith<$Res> {
  factory $PaymentMethodCopyWith(
          PaymentMethod value, $Res Function(PaymentMethod) then) =
      _$PaymentMethodCopyWithImpl<$Res, PaymentMethod>;
  @useResult
  $Res call(
      {String id,
      String type,
      String displayName,
      String maskedNumber,
      bool isDefault,
      String? expiryMonth,
      String? expiryYear});
}

/// @nodoc
class _$PaymentMethodCopyWithImpl<$Res, $Val extends PaymentMethod>
    implements $PaymentMethodCopyWith<$Res> {
  _$PaymentMethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? displayName = null,
    Object? maskedNumber = null,
    Object? isDefault = null,
    Object? expiryMonth = freezed,
    Object? expiryYear = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      maskedNumber: null == maskedNumber
          ? _value.maskedNumber
          : maskedNumber // ignore: cast_nullable_to_non_nullable
              as String,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      expiryMonth: freezed == expiryMonth
          ? _value.expiryMonth
          : expiryMonth // ignore: cast_nullable_to_non_nullable
              as String?,
      expiryYear: freezed == expiryYear
          ? _value.expiryYear
          : expiryYear // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentMethodImplCopyWith<$Res>
    implements $PaymentMethodCopyWith<$Res> {
  factory _$$PaymentMethodImplCopyWith(
          _$PaymentMethodImpl value, $Res Function(_$PaymentMethodImpl) then) =
      __$$PaymentMethodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
      String displayName,
      String maskedNumber,
      bool isDefault,
      String? expiryMonth,
      String? expiryYear});
}

/// @nodoc
class __$$PaymentMethodImplCopyWithImpl<$Res>
    extends _$PaymentMethodCopyWithImpl<$Res, _$PaymentMethodImpl>
    implements _$$PaymentMethodImplCopyWith<$Res> {
  __$$PaymentMethodImplCopyWithImpl(
      _$PaymentMethodImpl _value, $Res Function(_$PaymentMethodImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? displayName = null,
    Object? maskedNumber = null,
    Object? isDefault = null,
    Object? expiryMonth = freezed,
    Object? expiryYear = freezed,
  }) {
    return _then(_$PaymentMethodImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      maskedNumber: null == maskedNumber
          ? _value.maskedNumber
          : maskedNumber // ignore: cast_nullable_to_non_nullable
              as String,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      expiryMonth: freezed == expiryMonth
          ? _value.expiryMonth
          : expiryMonth // ignore: cast_nullable_to_non_nullable
              as String?,
      expiryYear: freezed == expiryYear
          ? _value.expiryYear
          : expiryYear // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentMethodImpl implements _PaymentMethod {
  const _$PaymentMethodImpl(
      {required this.id,
      required this.type,
      required this.displayName,
      required this.maskedNumber,
      required this.isDefault,
      this.expiryMonth,
      this.expiryYear});

  factory _$PaymentMethodImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentMethodImplFromJson(json);

  @override
  final String id;
  @override
  final String type;
  @override
  final String displayName;
  @override
  final String maskedNumber;
  @override
  final bool isDefault;
  @override
  final String? expiryMonth;
  @override
  final String? expiryYear;

  @override
  String toString() {
    return 'PaymentMethod(id: $id, type: $type, displayName: $displayName, maskedNumber: $maskedNumber, isDefault: $isDefault, expiryMonth: $expiryMonth, expiryYear: $expiryYear)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.maskedNumber, maskedNumber) ||
                other.maskedNumber == maskedNumber) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.expiryMonth, expiryMonth) ||
                other.expiryMonth == expiryMonth) &&
            (identical(other.expiryYear, expiryYear) ||
                other.expiryYear == expiryYear));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, displayName,
      maskedNumber, isDefault, expiryMonth, expiryYear);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodImplCopyWith<_$PaymentMethodImpl> get copyWith =>
      __$$PaymentMethodImplCopyWithImpl<_$PaymentMethodImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentMethodImplToJson(
      this,
    );
  }
}

abstract class _PaymentMethod implements PaymentMethod {
  const factory _PaymentMethod(
      {required final String id,
      required final String type,
      required final String displayName,
      required final String maskedNumber,
      required final bool isDefault,
      final String? expiryMonth,
      final String? expiryYear}) = _$PaymentMethodImpl;

  factory _PaymentMethod.fromJson(Map<String, dynamic> json) =
      _$PaymentMethodImpl.fromJson;

  @override
  String get id;
  @override
  String get type;
  @override
  String get displayName;
  @override
  String get maskedNumber;
  @override
  bool get isDefault;
  @override
  String? get expiryMonth;
  @override
  String? get expiryYear;
  @override
  @JsonKey(ignore: true)
  _$$PaymentMethodImplCopyWith<_$PaymentMethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
