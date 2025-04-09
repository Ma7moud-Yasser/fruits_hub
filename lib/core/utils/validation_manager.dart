class ValidationManager {
  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$',
  );

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  static String? validateEmail(String? email) {
    if (email == null || email.trim().isEmpty) {
      return 'البريد الإلكتروني مطلوب';
    } else if (!_emailRegExp.hasMatch(email.trim())) {
      return 'البريد الإلكتروني غير صحيح';
    }
    return null;
  }

  static Map<String, bool> validatePasswordChecklist(String password) {
    return {
      'يجب ألا تقل عن 8 أحرف': RegExp(r'.{8,}').hasMatch(password),
      'يجب أن تحتوي على حرف صغير': RegExp(r'[a-z]').hasMatch(password),
      'يجب أن تحتوي على حرف كبير': RegExp(r'[A-Z]').hasMatch(password),
      'يجب أن تحتوي على رقم': RegExp(r'\d').hasMatch(password),
      'يجب أن تحتوي على رمز مثل @ أو !': RegExp(r'[\W_]').hasMatch(password),
    };
  }

  static String? validateName(String? name) {
    if (name == null || name.trim().isEmpty) {
      return 'الاسم مطلوب';
    }
    return null;
  }

  static bool isValidEmail(String email) => _emailRegExp.hasMatch(email);
  static bool isValidPassword(String password) =>
      _passwordRegExp.hasMatch(password);
}
