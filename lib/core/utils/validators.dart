class Validators {
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) return 'البريد الإلكتروني مطلوب';
    if (!email.contains('@')) return 'بريد إلكتروني غير صحيح';
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) return 'كلمة المرور مطلوبة';
    if (password.length < 6) return 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
    return null;
  }

  static String? validatePhone(String? phone) {
    if (phone == null || phone.isEmpty) return 'رقم الهاتف مطلوب';
    if (phone.length < 9) return 'رقم هاتف غير صحيح';
    return null;
  }

  static String? validateName(String? name) {
    if (name == null || name.isEmpty) return 'الاسم مطلوب';
    if (name.length < 2) return 'الاسم يجب أن يكون حرفين على الأقل';
    return null;
  }

  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) return '$fieldName مطلوب';
    return null;
  }
}
