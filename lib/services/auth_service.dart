import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utils/constants.dart';

class AuthService {
  Future<Map<String, dynamic>> sendOtp(String phoneNumber) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/v1/api/citizen/authentication?mobile=$phoneNumber'),
        headers: {'Content-Type': 'application/json'},
      );

      return _processResponse(response);
    } catch (e) {
      return {'success': false, 'message': 'Failed to connect: $e'};
    }
  }

  Future<Map<String, dynamic>> verifyOtp(String phoneNumber, String otp) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/v1/api/citizen/verifyOtp?mobile=$phoneNumber&otp=$otp'),
        headers: {'Content-Type': 'application/json'}
      );

      return _processResponse(response);
    } catch (e) {
      return {'success': false, 'message': 'Failed to connect: $e'};
    }
  }

  Map<String, dynamic> _processResponse(http.Response response) {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return {'success': false, 'message': 'Error: ${response.body}'};
    }
  }
}
