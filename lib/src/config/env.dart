class Environment {
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://api.rewe.example.com',
  );

  static const String analyticsApiKey = String.fromEnvironment(
    'ANALYTICS_API_KEY',
    defaultValue: 'analytics_key_placeholder',
  );

  static const String appleSignInServiceId = String.fromEnvironment(
    'APPLE_SIGNIN_SERVICE_ID',
    defaultValue: 'com.yourcompany.rewe.signin',
  );

  static const bool isProduction = bool.fromEnvironment(
    'PRODUCTION',
    defaultValue: false,
  );

  static const String fcmSenderId = String.fromEnvironment(
    'FCM_SENDER_ID',
    defaultValue: '123456789012',
  );

  // Enable mock mode for frontend-only demo
  static const bool useMockData = true;
}