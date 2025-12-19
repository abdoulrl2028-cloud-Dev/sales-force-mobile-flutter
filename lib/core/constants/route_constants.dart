/// Constantes de rotas do aplicativo
class RouteConstants {
  RouteConstants._();

  // Rotas de autenticação
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String resetPassword = '/reset-password';

  // Rotas principais
  static const String home = '/home';
  static const String splash = '/';

  // Rotas de vendas
  static const String sales = '/sales';
  static const String saleDetail = '/sales/detail';
  static const String createSale = '/sales/create';
  static const String editSale = '/sales/edit';
  static const String salesReport = '/sales/report';

  // Rotas de produtos
  static const String products = '/products';
  static const String productDetail = '/products/detail';

  // Rotas de clientes
  static const String customers = '/customers';
  static const String customerDetail = '/customers/detail';

  // Rotas de perfil
  static const String profile = '/profile';
  static const String editProfile = '/profile/edit';
  static const String settings = '/settings';

  // Rotas de ajuda
  static const String help = '/help';
  static const String about = '/about';
}
