import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Your Windows desktop app talks to uvicorn running on your own machine.
  // (Note: on an Android emulator this would need to be http://10.0.2.2:8000)
  static const String baseUrl = "http://localhost:8000";

  /// Registers a new account.
  /// Returns true if the user was created, false if the username is taken.
  static Future<bool> register(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/create_user'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );

    return response.statusCode == 201;
  }
}
