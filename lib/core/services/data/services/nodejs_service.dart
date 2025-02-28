import 'package:fruits_hub/core/services/base_api_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NodeJsService implements BaseApiService {
  final String baseUrl = "https://my-nodejs-api.com";

  @override
  Future<void> login(String email, String password) async {
    var response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: jsonEncode({'email': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      print("Login successful");
    } else {
      throw Exception("Login failed");
    }
  }

  @override
  Future<void> register(String email, String password) async {
    var response = await http.post(
      Uri.parse('$baseUrl/register'),
      body: jsonEncode({'email': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      print("Registration successful");
    } else {
      throw Exception("Registration failed");
    }
  }

  @override
  Future<void> getUserData() async {
    var response = await http.get(Uri.parse('$baseUrl/user'));
    print("User data: ${response.body}");
  }
}
