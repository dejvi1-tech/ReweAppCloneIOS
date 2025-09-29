import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
@HiveType(typeId: 2)
class User with _$User {
  const factory User({
    @HiveField(0) required String id,
    @HiveField(1) required String email,
    @HiveField(2) required String firstName,
    @HiveField(3) required String lastName,
    @HiveField(4) String? phoneNumber,
    @HiveField(5) String? dateOfBirth,
    @HiveField(6) String? profileImageUrl,
    @HiveField(7) required DateTime createdAt,
    @HiveField(8) required DateTime updatedAt,
    @HiveField(9) required bool emailVerified,
    @HiveField(10) required bool phoneVerified,
    @HiveField(11) required UserPreferences preferences,
    @HiveField(12) required UserLoyalty loyalty,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
@HiveType(typeId: 3)
class UserPreferences with _$UserPreferences {
  const factory UserPreferences({
    @HiveField(0) required bool pushNotifications,
    @HiveField(1) required bool emailNotifications,
    @HiveField(2) required bool smsNotifications,
    @HiveField(3) required bool promotionalNotifications,
    @HiveField(4) required String language,
    @HiveField(5) required bool darkMode,
    @HiveField(6) required List<String> dietaryRestrictions,
    @HiveField(7) required List<String> allergens,
    @HiveField(8) required String preferredStore,
  }) = _UserPreferences;

  factory UserPreferences.fromJson(Map<String, dynamic> json) => _$UserPreferencesFromJson(json);
}

@freezed
@HiveType(typeId: 4)
class UserLoyalty with _$UserLoyalty {
  const factory UserLoyalty({
    @HiveField(0) required int points,
    @HiveField(1) required String tier,
    @HiveField(2) required double totalSpent,
    @HiveField(3) required int ordersCount,
    @HiveField(4) required double nextTierThreshold,
    @HiveField(5) required List<String> badges,
  }) = _UserLoyalty;

  factory UserLoyalty.fromJson(Map<String, dynamic> json) => _$UserLoyaltyFromJson(json);
}