import 'package:intl/intl.dart';

/// Formatadores de dados
class Formatters {
  Formatters._();

  /// Formata valor monetário
  static String currency(double value) {
    final formatter = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
      decimalDigits: 2,
    );
    return formatter.format(value);
  }

  /// Formata data
  static String date(DateTime date) {
    final formatter = DateFormat('dd/MM/yyyy', 'pt_BR');
    return formatter.format(date);
  }

  /// Formata data e hora
  static String dateTime(DateTime dateTime) {
    final formatter = DateFormat('dd/MM/yyyy HH:mm', 'pt_BR');
    return formatter.format(dateTime);
  }

  /// Formata hora
  static String time(DateTime time) {
    final formatter = DateFormat('HH:mm', 'pt_BR');
    return formatter.format(time);
  }

  /// Formata CPF
  static String cpf(String cpf) {
    if (cpf.length != 11) return cpf;
    return '${cpf.substring(0, 3)}.${cpf.substring(3, 6)}.${cpf.substring(6, 9)}-${cpf.substring(9, 11)}';
  }

  /// Formata telefone
  static String phone(String phone) {
    final numbers = phone.replaceAll(RegExp(r'[^\d]'), '');
    
    if (numbers.length == 10) {
      return '(${numbers.substring(0, 2)}) ${numbers.substring(2, 6)}-${numbers.substring(6, 10)}';
    } else if (numbers.length == 11) {
      return '(${numbers.substring(0, 2)}) ${numbers.substring(2, 7)}-${numbers.substring(7, 11)}';
    }
    
    return phone;
  }

  /// Formata porcentagem
  static String percentage(double value) {
    return '${value.toStringAsFixed(1)}%';
  }

  /// Formata número
  static String number(double value, {int decimalPlaces = 2}) {
    return value.toStringAsFixed(decimalPlaces);
  }
}
