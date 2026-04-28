import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/constants/api_endpoints.dart';

class ApiClient {
  final http.Client _client = http.Client();
  
  Future<dynamic> get(String endpoint) async {
    final response = await _client.get(Uri.parse('${ApiEndpoints.baseUrl}$endpoint'));
    return _handleResponse(response);
  }
  
  Future<dynamic> post(String endpoint, {Map<String, dynamic>? data}) async {
    final response = await _client.post(
      Uri.parse('${ApiEndpoints.baseUrl}$endpoint'),
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );
    return _handleResponse(response);
  }
  
  dynamic _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Request failed with status: ${response.statusCode}');
    }
  }
  
  void dispose() {
    _client.close();
  }
}
