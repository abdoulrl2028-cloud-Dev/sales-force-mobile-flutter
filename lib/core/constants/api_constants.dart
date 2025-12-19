/// Constantes relacionadas à API
class ApiConstants {
  ApiConstants._();

  // URLs base
  static const String baseUrl = 'https://api.salesforce.com/v1';
  static const String baseUrlDev = 'https://dev-api.salesforce.com/v1';

  // Endpoints de autenticação
  static const String login = '/auth/login';
  static const String logout = '/auth/logout';
  static const String register = '/auth/register';
  static const String refreshToken = '/auth/refresh';
  static const String forgotPassword = '/auth/forgot-password';
  static const String resetPassword = '/auth/reset-password';

  // Endpoints de vendas
  static const String sales = '/sales';
  static const String salesById = '/sales/{id}';
  static const String createSale = '/sales';
  static const String updateSale = '/sales/{id}';
  static const String deleteSale = '/sales/{id}';
  static const String salesReport = '/sales/report';

  // Endpoints de produtos
  static const String products = '/products';
  static const String productById = '/products/{id}';

  // Endpoints de clientes
  static const String customers = '/customers';
  static const String customerById = '/customers/{id}';

  // Timeouts
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);

  // Headers
  static const String headerContentType = 'Content-Type';
  static const String headerAuthorization = 'Authorization';
  static const String headerAccept = 'Accept';

  // Content types
  static const String contentTypeJson = 'application/json';
  static const String contentTypeFormData = 'multipart/form-data';
}
