// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 2;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      id: fields[0] as String,
      email: fields[1] as String,
      firstName: fields[2] as String,
      lastName: fields[3] as String,
      phoneNumber: fields[4] as String?,
      dateOfBirth: fields[5] as String?,
      profileImageUrl: fields[6] as String?,
      createdAt: fields[7] as DateTime,
      updatedAt: fields[8] as DateTime,
      emailVerified: fields[9] as bool,
      phoneVerified: fields[10] as bool,
      preferences: fields[11] as UserPreferences,
      loyalty: fields[12] as UserLoyalty,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.firstName)
      ..writeByte(3)
      ..write(obj.lastName)
      ..writeByte(4)
      ..write(obj.phoneNumber)
      ..writeByte(5)
      ..write(obj.dateOfBirth)
      ..writeByte(6)
      ..write(obj.profileImageUrl)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.updatedAt)
      ..writeByte(9)
      ..write(obj.emailVerified)
      ..writeByte(10)
      ..write(obj.phoneVerified)
      ..writeByte(11)
      ..write(obj.preferences)
      ..writeByte(12)
      ..write(obj.loyalty);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserPreferencesAdapter extends TypeAdapter<UserPreferences> {
  @override
  final int typeId = 3;

  @override
  UserPreferences read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserPreferences(
      pushNotifications: fields[0] as bool,
      emailNotifications: fields[1] as bool,
      smsNotifications: fields[2] as bool,
      promotionalNotifications: fields[3] as bool,
      language: fields[4] as String,
      darkMode: fields[5] as bool,
      dietaryRestrictions: (fields[6] as List).cast<String>(),
      allergens: (fields[7] as List).cast<String>(),
      preferredStore: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserPreferences obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.pushNotifications)
      ..writeByte(1)
      ..write(obj.emailNotifications)
      ..writeByte(2)
      ..write(obj.smsNotifications)
      ..writeByte(3)
      ..write(obj.promotionalNotifications)
      ..writeByte(4)
      ..write(obj.language)
      ..writeByte(5)
      ..write(obj.darkMode)
      ..writeByte(6)
      ..write(obj.dietaryRestrictions)
      ..writeByte(7)
      ..write(obj.allergens)
      ..writeByte(8)
      ..write(obj.preferredStore);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserPreferencesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserLoyaltyAdapter extends TypeAdapter<UserLoyalty> {
  @override
  final int typeId = 4;

  @override
  UserLoyalty read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserLoyalty(
      points: fields[0] as int,
      tier: fields[1] as String,
      totalSpent: fields[2] as double,
      ordersCount: fields[3] as int,
      nextTierThreshold: fields[4] as double,
      badges: (fields[5] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, UserLoyalty obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.points)
      ..writeByte(1)
      ..write(obj.tier)
      ..writeByte(2)
      ..write(obj.totalSpent)
      ..writeByte(3)
      ..write(obj.ordersCount)
      ..writeByte(4)
      ..write(obj.nextTierThreshold)
      ..writeByte(5)
      ..write(obj.badges);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserLoyaltyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      phoneNumber: json['phoneNumber'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      emailVerified: json['emailVerified'] as bool,
      phoneVerified: json['phoneVerified'] as bool,
      preferences:
          UserPreferences.fromJson(json['preferences'] as Map<String, dynamic>),
      loyalty: UserLoyalty.fromJson(json['loyalty'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phoneNumber': instance.phoneNumber,
      'dateOfBirth': instance.dateOfBirth,
      'profileImageUrl': instance.profileImageUrl,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'emailVerified': instance.emailVerified,
      'phoneVerified': instance.phoneVerified,
      'preferences': instance.preferences,
      'loyalty': instance.loyalty,
    };

_$UserPreferencesImpl _$$UserPreferencesImplFromJson(
        Map<String, dynamic> json) =>
    _$UserPreferencesImpl(
      pushNotifications: json['pushNotifications'] as bool,
      emailNotifications: json['emailNotifications'] as bool,
      smsNotifications: json['smsNotifications'] as bool,
      promotionalNotifications: json['promotionalNotifications'] as bool,
      language: json['language'] as String,
      darkMode: json['darkMode'] as bool,
      dietaryRestrictions: (json['dietaryRestrictions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      allergens:
          (json['allergens'] as List<dynamic>).map((e) => e as String).toList(),
      preferredStore: json['preferredStore'] as String,
    );

Map<String, dynamic> _$$UserPreferencesImplToJson(
        _$UserPreferencesImpl instance) =>
    <String, dynamic>{
      'pushNotifications': instance.pushNotifications,
      'emailNotifications': instance.emailNotifications,
      'smsNotifications': instance.smsNotifications,
      'promotionalNotifications': instance.promotionalNotifications,
      'language': instance.language,
      'darkMode': instance.darkMode,
      'dietaryRestrictions': instance.dietaryRestrictions,
      'allergens': instance.allergens,
      'preferredStore': instance.preferredStore,
    };

_$UserLoyaltyImpl _$$UserLoyaltyImplFromJson(Map<String, dynamic> json) =>
    _$UserLoyaltyImpl(
      points: (json['points'] as num).toInt(),
      tier: json['tier'] as String,
      totalSpent: (json['totalSpent'] as num).toDouble(),
      ordersCount: (json['ordersCount'] as num).toInt(),
      nextTierThreshold: (json['nextTierThreshold'] as num).toDouble(),
      badges:
          (json['badges'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$UserLoyaltyImplToJson(_$UserLoyaltyImpl instance) =>
    <String, dynamic>{
      'points': instance.points,
      'tier': instance.tier,
      'totalSpent': instance.totalSpent,
      'ordersCount': instance.ordersCount,
      'nextTierThreshold': instance.nextTierThreshold,
      'badges': instance.badges,
    };
