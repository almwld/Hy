class ApiEndpoints {
  static const String baseUrl = 'https://api.sehatak.com/v1';

  // Auth
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String forgotPassword = '/auth/forgot-password';
  static const String verifyOtp = '/auth/verify-otp';
  static const String logout = '/auth/logout';

  // User
  static const String profile = '/user/profile';
  static const String updateProfile = '/user/update-profile';
  static const String medicalHistory = '/user/medical-history';

  // Doctors
  static const String doctors = '/doctors';
  static const String doctorDetails = '/doctors/{id}';

  // Consultations
  static const String consultations = '/consultations';
  static const String consultationDetails = '/consultations/{id}';
  static const String startConsultation = '/consultations/start';
  static const String sendMessage = '/consultations/{id}/messages';
  static const String rateConsultation = '/consultations/{id}/rate';

  // Pharmacy
  static const String pharmacies = '/pharmacies';
  static const String products = '/products';
  static const String orders = '/orders';

  // Payment
  static const String paymentMethods = '/payment/methods';
  static const String processPayment = '/payment/process';

  // Notifications
  static const String notifications = '/notifications';
}
