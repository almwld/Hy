import 'api_client.dart';

class AuthApi {
  final ApiClient _client = ApiClient();
  
  Future<Map<String, dynamic>> login(String email, String password) async {
    return await _client.post('/auth/login', data: {'email': email, 'password': password});
  }
  
  Future<Map<String, dynamic>> register(Map<String, dynamic> userData) async {
    return await _client.post('/auth/register', data: userData);
  }
  
  Future<Map<String, dynamic>> verifyOtp(String phone, String otp) async {
    return await _client.post('/auth/verify-otp', data: {'phone': phone, 'otp': otp});
  }
}
