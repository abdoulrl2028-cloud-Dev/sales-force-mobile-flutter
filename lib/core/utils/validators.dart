/// Validadores para formulários
class Validators {
  Validators._();

  /// Valida se o email é válido
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email é obrigatório';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Email inválido';
    }

    return null;
  }

  /// Valida se a senha é válida
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Senha é obrigatória';
    }

    if (value.length < 6) {
      return 'A senha deve ter no mínimo 6 caracteres';
    }

    return null;
  }

  /// Valida se o campo é obrigatório
  static String? required(String? value, {String fieldName = 'Campo'}) {
    if (value == null || value.isEmpty) {
      return '$fieldName é obrigatório';
    }

    return null;
  }

  /// Valida se o CPF é válido
  static String? cpf(String? value) {
    if (value == null || value.isEmpty) {
      return 'CPF é obrigatório';
    }

    // Remove caracteres não numéricos
    final cpfNumbers = value.replaceAll(RegExp(r'[^\d]'), '');

    if (cpfNumbers.length != 11) {
      return 'CPF deve ter 11 dígitos';
    }

    // Verifica se todos os dígitos são iguais
    if (RegExp(r'^(\d)\1{10}$').hasMatch(cpfNumbers)) {
      return 'CPF inválido';
    }

    return null;
  }

  /// Valida se o telefone é válido
  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Telefone é obrigatório';
    }

    // Remove caracteres não numéricos
    final phoneNumbers = value.replaceAll(RegExp(r'[^\d]'), '');

    if (phoneNumbers.length < 10 || phoneNumbers.length > 11) {
      return 'Telefone inválido';
    }

    return null;
  }

  /// Valida se o valor é numérico
  static String? numeric(String? value, {String fieldName = 'Campo'}) {
    if (value == null || value.isEmpty) {
      return '$fieldName é obrigatório';
    }

    if (double.tryParse(value) == null) {
      return '$fieldName deve ser um número válido';
    }

    return null;
  }

  /// Valida valor mínimo
  static String? min(String? value, double minValue, {String fieldName = 'Valor'}) {
    if (value == null || value.isEmpty) {
      return '$fieldName é obrigatório';
    }

    final numValue = double.tryParse(value);
    if (numValue == null) {
      return '$fieldName deve ser um número válido';
    }

    if (numValue < minValue) {
      return '$fieldName deve ser maior ou igual a $minValue';
    }

    return null;
  }

  /// Valida valor máximo
  static String? max(String? value, double maxValue, {String fieldName = 'Valor'}) {
    if (value == null || value.isEmpty) {
      return '$fieldName é obrigatório';
    }

    final numValue = double.tryParse(value);
    if (numValue == null) {
      return '$fieldName deve ser um número válido';
    }

    if (numValue > maxValue) {
      return '$fieldName deve ser menor ou igual a $maxValue';
    }

    return null;
  }
}
