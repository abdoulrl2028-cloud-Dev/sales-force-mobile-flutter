/// Constantes gerais do aplicativo
class AppConstants {
  AppConstants._();

  // Informações do app
  static const String appName = 'Sales Force Mobile';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'Aplicativo de força de vendas';

  // Chaves de armazenamento
  static const String keyToken = 'auth_token';
  static const String keyRefreshToken = 'refresh_token';
  static const String keyUserId = 'user_id';
  static const String keyUserEmail = 'user_email';
  static const String keyUserName = 'user_name';
  static const String keyThemeMode = 'theme_mode';
  static const String keyLanguage = 'language';

  // Limites e validações
  static const int minPasswordLength = 6;
  static const int maxPasswordLength = 20;
  static const int maxImageSize = 5 * 1024 * 1024; // 5MB

  // Paginação
  static const int pageSize = 20;
  static const int initialPage = 1;

  // Duração de animações
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);

  // URLs de suporte
  static const String supportEmail = 'suporte@salesforce.com';
  static const String privacyPolicyUrl = 'https://salesforce.com/privacy';
  static const String termsOfServiceUrl = 'https://salesforce.com/terms';

  // Expressões regulares
  static final RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );
  static final RegExp phoneRegex = RegExp(r'^\(\d{2}\) \d{4,5}-\d{4}$');
  static final RegExp cpfRegex = RegExp(r'^\d{3}\.\d{3}\.\d{3}-\d{2}$');

  // Status de venda
  static const String saleStatusPending = 'pending';
  static const String saleStatusCompleted = 'completed';
  static const String saleStatusCancelled = 'cancelled';
}
