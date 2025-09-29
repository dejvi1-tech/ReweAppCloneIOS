// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get email => throw _privateConstructorUsedError;
  @HiveField(2)
  String get firstName => throw _privateConstructorUsedError;
  @HiveField(3)
  String get lastName => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get phoneNumber => throw _privateConstructorUsedError;
  @HiveField(5)
  String? get dateOfBirth => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get profileImageUrl => throw _privateConstructorUsedError;
  @HiveField(7)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @HiveField(8)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @HiveField(9)
  bool get emailVerified => throw _privateConstructorUsedError;
  @HiveField(10)
  bool get phoneVerified => throw _privateConstructorUsedError;
  @HiveField(11)
  UserPreferences get preferences => throw _privateConstructorUsedError;
  @HiveField(12)
  UserLoyalty get loyalty => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String email,
      @HiveField(2) String firstName,
      @HiveField(3) String lastName,
      @HiveField(4) String? phoneNumber,
      @HiveField(5) String? dateOfBirth,
      @HiveField(6) String? profileImageUrl,
      @HiveField(7) DateTime createdAt,
      @HiveField(8) DateTime updatedAt,
      @HiveField(9) bool emailVerified,
      @HiveField(10) bool phoneVerified,
      @HiveField(11) UserPreferences preferences,
      @HiveField(12) UserLoyalty loyalty});

  $UserPreferencesCopyWith<$Res> get preferences;
  $UserLoyaltyCopyWith<$Res> get loyalty;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? phoneNumber = freezed,
    Object? dateOfBirth = freezed,
    Object? profileImageUrl = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? emailVerified = null,
    Object? phoneVerified = null,
    Object? preferences = null,
    Object? loyalty = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      emailVerified: null == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneVerified: null == phoneVerified
          ? _value.phoneVerified
          : phoneVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      preferences: null == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as UserPreferences,
      loyalty: null == loyalty
          ? _value.loyalty
          : loyalty // ignore: cast_nullable_to_non_nullable
              as UserLoyalty,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserPreferencesCopyWith<$Res> get preferences {
    return $UserPreferencesCopyWith<$Res>(_value.preferences, (value) {
      return _then(_value.copyWith(preferences: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserLoyaltyCopyWith<$Res> get loyalty {
    return $UserLoyaltyCopyWith<$Res>(_value.loyalty, (value) {
      return _then(_value.copyWith(loyalty: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String email,
      @HiveField(2) String firstName,
      @HiveField(3) String lastName,
      @HiveField(4) String? phoneNumber,
      @HiveField(5) String? dateOfBirth,
      @HiveField(6) String? profileImageUrl,
      @HiveField(7) DateTime createdAt,
      @HiveField(8) DateTime updatedAt,
      @HiveField(9) bool emailVerified,
      @HiveField(10) bool phoneVerified,
      @HiveField(11) UserPreferences preferences,
      @HiveField(12) UserLoyalty loyalty});

  @override
  $UserPreferencesCopyWith<$Res> get preferences;
  @override
  $UserLoyaltyCopyWith<$Res> get loyalty;
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? phoneNumber = freezed,
    Object? dateOfBirth = freezed,
    Object? profileImageUrl = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? emailVerified = null,
    Object? phoneVerified = null,
    Object? preferences = null,
    Object? loyalty = null,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      emailVerified: null == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      phoneVerified: null == phoneVerified
          ? _value.phoneVerified
          : phoneVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      preferences: null == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as UserPreferences,
      loyalty: null == loyalty
          ? _value.loyalty
          : loyalty // ignore: cast_nullable_to_non_nullable
              as UserLoyalty,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.email,
      @HiveField(2) required this.firstName,
      @HiveField(3) required this.lastName,
      @HiveField(4) this.phoneNumber,
      @HiveField(5) this.dateOfBirth,
      @HiveField(6) this.profileImageUrl,
      @HiveField(7) required this.createdAt,
      @HiveField(8) required this.updatedAt,
      @HiveField(9) required this.emailVerified,
      @HiveField(10) required this.phoneVerified,
      @HiveField(11) required this.preferences,
      @HiveField(12) required this.loyalty});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String email;
  @override
  @HiveField(2)
  final String firstName;
  @override
  @HiveField(3)
  final String lastName;
  @override
  @HiveField(4)
  final String? phoneNumber;
  @override
  @HiveField(5)
  final String? dateOfBirth;
  @override
  @HiveField(6)
  final String? profileImageUrl;
  @override
  @HiveField(7)
  final DateTime createdAt;
  @override
  @HiveField(8)
  final DateTime updatedAt;
  @override
  @HiveField(9)
  final bool emailVerified;
  @override
  @HiveField(10)
  final bool phoneVerified;
  @override
  @HiveField(11)
  final UserPreferences preferences;
  @override
  @HiveField(12)
  final UserLoyalty loyalty;

  @override
  String toString() {
    return 'User(id: $id, email: $email, firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, dateOfBirth: $dateOfBirth, profileImageUrl: $profileImageUrl, createdAt: $createdAt, updatedAt: $updatedAt, emailVerified: $emailVerified, phoneVerified: $phoneVerified, preferences: $preferences, loyalty: $loyalty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.phoneVerified, phoneVerified) ||
                other.phoneVerified == phoneVerified) &&
            (identical(other.preferences, preferences) ||
                other.preferences == preferences) &&
            (identical(other.loyalty, loyalty) || other.loyalty == loyalty));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      email,
      firstName,
      lastName,
      phoneNumber,
      dateOfBirth,
      profileImageUrl,
      createdAt,
      updatedAt,
      emailVerified,
      phoneVerified,
      preferences,
      loyalty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String email,
      @HiveField(2) required final String firstName,
      @HiveField(3) required final String lastName,
      @HiveField(4) final String? phoneNumber,
      @HiveField(5) final String? dateOfBirth,
      @HiveField(6) final String? profileImageUrl,
      @HiveField(7) required final DateTime createdAt,
      @HiveField(8) required final DateTime updatedAt,
      @HiveField(9) required final bool emailVerified,
      @HiveField(10) required final bool phoneVerified,
      @HiveField(11) required final UserPreferences preferences,
      @HiveField(12) required final UserLoyalty loyalty}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get email;
  @override
  @HiveField(2)
  String get firstName;
  @override
  @HiveField(3)
  String get lastName;
  @override
  @HiveField(4)
  String? get phoneNumber;
  @override
  @HiveField(5)
  String? get dateOfBirth;
  @override
  @HiveField(6)
  String? get profileImageUrl;
  @override
  @HiveField(7)
  DateTime get createdAt;
  @override
  @HiveField(8)
  DateTime get updatedAt;
  @override
  @HiveField(9)
  bool get emailVerified;
  @override
  @HiveField(10)
  bool get phoneVerified;
  @override
  @HiveField(11)
  UserPreferences get preferences;
  @override
  @HiveField(12)
  UserLoyalty get loyalty;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserPreferences _$UserPreferencesFromJson(Map<String, dynamic> json) {
  return _UserPreferences.fromJson(json);
}

/// @nodoc
mixin _$UserPreferences {
  @HiveField(0)
  bool get pushNotifications => throw _privateConstructorUsedError;
  @HiveField(1)
  bool get emailNotifications => throw _privateConstructorUsedError;
  @HiveField(2)
  bool get smsNotifications => throw _privateConstructorUsedError;
  @HiveField(3)
  bool get promotionalNotifications => throw _privateConstructorUsedError;
  @HiveField(4)
  String get language => throw _privateConstructorUsedError;
  @HiveField(5)
  bool get darkMode => throw _privateConstructorUsedError;
  @HiveField(6)
  List<String> get dietaryRestrictions => throw _privateConstructorUsedError;
  @HiveField(7)
  List<String> get allergens => throw _privateConstructorUsedError;
  @HiveField(8)
  String get preferredStore => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserPreferencesCopyWith<UserPreferences> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPreferencesCopyWith<$Res> {
  factory $UserPreferencesCopyWith(
          UserPreferences value, $Res Function(UserPreferences) then) =
      _$UserPreferencesCopyWithImpl<$Res, UserPreferences>;
  @useResult
  $Res call(
      {@HiveField(0) bool pushNotifications,
      @HiveField(1) bool emailNotifications,
      @HiveField(2) bool smsNotifications,
      @HiveField(3) bool promotionalNotifications,
      @HiveField(4) String language,
      @HiveField(5) bool darkMode,
      @HiveField(6) List<String> dietaryRestrictions,
      @HiveField(7) List<String> allergens,
      @HiveField(8) String preferredStore});
}

/// @nodoc
class _$UserPreferencesCopyWithImpl<$Res, $Val extends UserPreferences>
    implements $UserPreferencesCopyWith<$Res> {
  _$UserPreferencesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pushNotifications = null,
    Object? emailNotifications = null,
    Object? smsNotifications = null,
    Object? promotionalNotifications = null,
    Object? language = null,
    Object? darkMode = null,
    Object? dietaryRestrictions = null,
    Object? allergens = null,
    Object? preferredStore = null,
  }) {
    return _then(_value.copyWith(
      pushNotifications: null == pushNotifications
          ? _value.pushNotifications
          : pushNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      emailNotifications: null == emailNotifications
          ? _value.emailNotifications
          : emailNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      smsNotifications: null == smsNotifications
          ? _value.smsNotifications
          : smsNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      promotionalNotifications: null == promotionalNotifications
          ? _value.promotionalNotifications
          : promotionalNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      darkMode: null == darkMode
          ? _value.darkMode
          : darkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      dietaryRestrictions: null == dietaryRestrictions
          ? _value.dietaryRestrictions
          : dietaryRestrictions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      allergens: null == allergens
          ? _value.allergens
          : allergens // ignore: cast_nullable_to_non_nullable
              as List<String>,
      preferredStore: null == preferredStore
          ? _value.preferredStore
          : preferredStore // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPreferencesImplCopyWith<$Res>
    implements $UserPreferencesCopyWith<$Res> {
  factory _$$UserPreferencesImplCopyWith(_$UserPreferencesImpl value,
          $Res Function(_$UserPreferencesImpl) then) =
      __$$UserPreferencesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) bool pushNotifications,
      @HiveField(1) bool emailNotifications,
      @HiveField(2) bool smsNotifications,
      @HiveField(3) bool promotionalNotifications,
      @HiveField(4) String language,
      @HiveField(5) bool darkMode,
      @HiveField(6) List<String> dietaryRestrictions,
      @HiveField(7) List<String> allergens,
      @HiveField(8) String preferredStore});
}

/// @nodoc
class __$$UserPreferencesImplCopyWithImpl<$Res>
    extends _$UserPreferencesCopyWithImpl<$Res, _$UserPreferencesImpl>
    implements _$$UserPreferencesImplCopyWith<$Res> {
  __$$UserPreferencesImplCopyWithImpl(
      _$UserPreferencesImpl _value, $Res Function(_$UserPreferencesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pushNotifications = null,
    Object? emailNotifications = null,
    Object? smsNotifications = null,
    Object? promotionalNotifications = null,
    Object? language = null,
    Object? darkMode = null,
    Object? dietaryRestrictions = null,
    Object? allergens = null,
    Object? preferredStore = null,
  }) {
    return _then(_$UserPreferencesImpl(
      pushNotifications: null == pushNotifications
          ? _value.pushNotifications
          : pushNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      emailNotifications: null == emailNotifications
          ? _value.emailNotifications
          : emailNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      smsNotifications: null == smsNotifications
          ? _value.smsNotifications
          : smsNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      promotionalNotifications: null == promotionalNotifications
          ? _value.promotionalNotifications
          : promotionalNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      darkMode: null == darkMode
          ? _value.darkMode
          : darkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      dietaryRestrictions: null == dietaryRestrictions
          ? _value._dietaryRestrictions
          : dietaryRestrictions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      allergens: null == allergens
          ? _value._allergens
          : allergens // ignore: cast_nullable_to_non_nullable
              as List<String>,
      preferredStore: null == preferredStore
          ? _value.preferredStore
          : preferredStore // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPreferencesImpl implements _UserPreferences {
  const _$UserPreferencesImpl(
      {@HiveField(0) required this.pushNotifications,
      @HiveField(1) required this.emailNotifications,
      @HiveField(2) required this.smsNotifications,
      @HiveField(3) required this.promotionalNotifications,
      @HiveField(4) required this.language,
      @HiveField(5) required this.darkMode,
      @HiveField(6) required final List<String> dietaryRestrictions,
      @HiveField(7) required final List<String> allergens,
      @HiveField(8) required this.preferredStore})
      : _dietaryRestrictions = dietaryRestrictions,
        _allergens = allergens;

  factory _$UserPreferencesImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPreferencesImplFromJson(json);

  @override
  @HiveField(0)
  final bool pushNotifications;
  @override
  @HiveField(1)
  final bool emailNotifications;
  @override
  @HiveField(2)
  final bool smsNotifications;
  @override
  @HiveField(3)
  final bool promotionalNotifications;
  @override
  @HiveField(4)
  final String language;
  @override
  @HiveField(5)
  final bool darkMode;
  final List<String> _dietaryRestrictions;
  @override
  @HiveField(6)
  List<String> get dietaryRestrictions {
    if (_dietaryRestrictions is EqualUnmodifiableListView)
      return _dietaryRestrictions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dietaryRestrictions);
  }

  final List<String> _allergens;
  @override
  @HiveField(7)
  List<String> get allergens {
    if (_allergens is EqualUnmodifiableListView) return _allergens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allergens);
  }

  @override
  @HiveField(8)
  final String preferredStore;

  @override
  String toString() {
    return 'UserPreferences(pushNotifications: $pushNotifications, emailNotifications: $emailNotifications, smsNotifications: $smsNotifications, promotionalNotifications: $promotionalNotifications, language: $language, darkMode: $darkMode, dietaryRestrictions: $dietaryRestrictions, allergens: $allergens, preferredStore: $preferredStore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPreferencesImpl &&
            (identical(other.pushNotifications, pushNotifications) ||
                other.pushNotifications == pushNotifications) &&
            (identical(other.emailNotifications, emailNotifications) ||
                other.emailNotifications == emailNotifications) &&
            (identical(other.smsNotifications, smsNotifications) ||
                other.smsNotifications == smsNotifications) &&
            (identical(
                    other.promotionalNotifications, promotionalNotifications) ||
                other.promotionalNotifications == promotionalNotifications) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.darkMode, darkMode) ||
                other.darkMode == darkMode) &&
            const DeepCollectionEquality()
                .equals(other._dietaryRestrictions, _dietaryRestrictions) &&
            const DeepCollectionEquality()
                .equals(other._allergens, _allergens) &&
            (identical(other.preferredStore, preferredStore) ||
                other.preferredStore == preferredStore));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      pushNotifications,
      emailNotifications,
      smsNotifications,
      promotionalNotifications,
      language,
      darkMode,
      const DeepCollectionEquality().hash(_dietaryRestrictions),
      const DeepCollectionEquality().hash(_allergens),
      preferredStore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPreferencesImplCopyWith<_$UserPreferencesImpl> get copyWith =>
      __$$UserPreferencesImplCopyWithImpl<_$UserPreferencesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPreferencesImplToJson(
      this,
    );
  }
}

abstract class _UserPreferences implements UserPreferences {
  const factory _UserPreferences(
          {@HiveField(0) required final bool pushNotifications,
          @HiveField(1) required final bool emailNotifications,
          @HiveField(2) required final bool smsNotifications,
          @HiveField(3) required final bool promotionalNotifications,
          @HiveField(4) required final String language,
          @HiveField(5) required final bool darkMode,
          @HiveField(6) required final List<String> dietaryRestrictions,
          @HiveField(7) required final List<String> allergens,
          @HiveField(8) required final String preferredStore}) =
      _$UserPreferencesImpl;

  factory _UserPreferences.fromJson(Map<String, dynamic> json) =
      _$UserPreferencesImpl.fromJson;

  @override
  @HiveField(0)
  bool get pushNotifications;
  @override
  @HiveField(1)
  bool get emailNotifications;
  @override
  @HiveField(2)
  bool get smsNotifications;
  @override
  @HiveField(3)
  bool get promotionalNotifications;
  @override
  @HiveField(4)
  String get language;
  @override
  @HiveField(5)
  bool get darkMode;
  @override
  @HiveField(6)
  List<String> get dietaryRestrictions;
  @override
  @HiveField(7)
  List<String> get allergens;
  @override
  @HiveField(8)
  String get preferredStore;
  @override
  @JsonKey(ignore: true)
  _$$UserPreferencesImplCopyWith<_$UserPreferencesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserLoyalty _$UserLoyaltyFromJson(Map<String, dynamic> json) {
  return _UserLoyalty.fromJson(json);
}

/// @nodoc
mixin _$UserLoyalty {
  @HiveField(0)
  int get points => throw _privateConstructorUsedError;
  @HiveField(1)
  String get tier => throw _privateConstructorUsedError;
  @HiveField(2)
  double get totalSpent => throw _privateConstructorUsedError;
  @HiveField(3)
  int get ordersCount => throw _privateConstructorUsedError;
  @HiveField(4)
  double get nextTierThreshold => throw _privateConstructorUsedError;
  @HiveField(5)
  List<String> get badges => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserLoyaltyCopyWith<UserLoyalty> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserLoyaltyCopyWith<$Res> {
  factory $UserLoyaltyCopyWith(
          UserLoyalty value, $Res Function(UserLoyalty) then) =
      _$UserLoyaltyCopyWithImpl<$Res, UserLoyalty>;
  @useResult
  $Res call(
      {@HiveField(0) int points,
      @HiveField(1) String tier,
      @HiveField(2) double totalSpent,
      @HiveField(3) int ordersCount,
      @HiveField(4) double nextTierThreshold,
      @HiveField(5) List<String> badges});
}

/// @nodoc
class _$UserLoyaltyCopyWithImpl<$Res, $Val extends UserLoyalty>
    implements $UserLoyaltyCopyWith<$Res> {
  _$UserLoyaltyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? points = null,
    Object? tier = null,
    Object? totalSpent = null,
    Object? ordersCount = null,
    Object? nextTierThreshold = null,
    Object? badges = null,
  }) {
    return _then(_value.copyWith(
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      tier: null == tier
          ? _value.tier
          : tier // ignore: cast_nullable_to_non_nullable
              as String,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      ordersCount: null == ordersCount
          ? _value.ordersCount
          : ordersCount // ignore: cast_nullable_to_non_nullable
              as int,
      nextTierThreshold: null == nextTierThreshold
          ? _value.nextTierThreshold
          : nextTierThreshold // ignore: cast_nullable_to_non_nullable
              as double,
      badges: null == badges
          ? _value.badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserLoyaltyImplCopyWith<$Res>
    implements $UserLoyaltyCopyWith<$Res> {
  factory _$$UserLoyaltyImplCopyWith(
          _$UserLoyaltyImpl value, $Res Function(_$UserLoyaltyImpl) then) =
      __$$UserLoyaltyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int points,
      @HiveField(1) String tier,
      @HiveField(2) double totalSpent,
      @HiveField(3) int ordersCount,
      @HiveField(4) double nextTierThreshold,
      @HiveField(5) List<String> badges});
}

/// @nodoc
class __$$UserLoyaltyImplCopyWithImpl<$Res>
    extends _$UserLoyaltyCopyWithImpl<$Res, _$UserLoyaltyImpl>
    implements _$$UserLoyaltyImplCopyWith<$Res> {
  __$$UserLoyaltyImplCopyWithImpl(
      _$UserLoyaltyImpl _value, $Res Function(_$UserLoyaltyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? points = null,
    Object? tier = null,
    Object? totalSpent = null,
    Object? ordersCount = null,
    Object? nextTierThreshold = null,
    Object? badges = null,
  }) {
    return _then(_$UserLoyaltyImpl(
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      tier: null == tier
          ? _value.tier
          : tier // ignore: cast_nullable_to_non_nullable
              as String,
      totalSpent: null == totalSpent
          ? _value.totalSpent
          : totalSpent // ignore: cast_nullable_to_non_nullable
              as double,
      ordersCount: null == ordersCount
          ? _value.ordersCount
          : ordersCount // ignore: cast_nullable_to_non_nullable
              as int,
      nextTierThreshold: null == nextTierThreshold
          ? _value.nextTierThreshold
          : nextTierThreshold // ignore: cast_nullable_to_non_nullable
              as double,
      badges: null == badges
          ? _value._badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserLoyaltyImpl implements _UserLoyalty {
  const _$UserLoyaltyImpl(
      {@HiveField(0) required this.points,
      @HiveField(1) required this.tier,
      @HiveField(2) required this.totalSpent,
      @HiveField(3) required this.ordersCount,
      @HiveField(4) required this.nextTierThreshold,
      @HiveField(5) required final List<String> badges})
      : _badges = badges;

  factory _$UserLoyaltyImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserLoyaltyImplFromJson(json);

  @override
  @HiveField(0)
  final int points;
  @override
  @HiveField(1)
  final String tier;
  @override
  @HiveField(2)
  final double totalSpent;
  @override
  @HiveField(3)
  final int ordersCount;
  @override
  @HiveField(4)
  final double nextTierThreshold;
  final List<String> _badges;
  @override
  @HiveField(5)
  List<String> get badges {
    if (_badges is EqualUnmodifiableListView) return _badges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_badges);
  }

  @override
  String toString() {
    return 'UserLoyalty(points: $points, tier: $tier, totalSpent: $totalSpent, ordersCount: $ordersCount, nextTierThreshold: $nextTierThreshold, badges: $badges)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserLoyaltyImpl &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.tier, tier) || other.tier == tier) &&
            (identical(other.totalSpent, totalSpent) ||
                other.totalSpent == totalSpent) &&
            (identical(other.ordersCount, ordersCount) ||
                other.ordersCount == ordersCount) &&
            (identical(other.nextTierThreshold, nextTierThreshold) ||
                other.nextTierThreshold == nextTierThreshold) &&
            const DeepCollectionEquality().equals(other._badges, _badges));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      points,
      tier,
      totalSpent,
      ordersCount,
      nextTierThreshold,
      const DeepCollectionEquality().hash(_badges));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserLoyaltyImplCopyWith<_$UserLoyaltyImpl> get copyWith =>
      __$$UserLoyaltyImplCopyWithImpl<_$UserLoyaltyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserLoyaltyImplToJson(
      this,
    );
  }
}

abstract class _UserLoyalty implements UserLoyalty {
  const factory _UserLoyalty(
      {@HiveField(0) required final int points,
      @HiveField(1) required final String tier,
      @HiveField(2) required final double totalSpent,
      @HiveField(3) required final int ordersCount,
      @HiveField(4) required final double nextTierThreshold,
      @HiveField(5) required final List<String> badges}) = _$UserLoyaltyImpl;

  factory _UserLoyalty.fromJson(Map<String, dynamic> json) =
      _$UserLoyaltyImpl.fromJson;

  @override
  @HiveField(0)
  int get points;
  @override
  @HiveField(1)
  String get tier;
  @override
  @HiveField(2)
  double get totalSpent;
  @override
  @HiveField(3)
  int get ordersCount;
  @override
  @HiveField(4)
  double get nextTierThreshold;
  @override
  @HiveField(5)
  List<String> get badges;
  @override
  @JsonKey(ignore: true)
  _$$UserLoyaltyImplCopyWith<_$UserLoyaltyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
