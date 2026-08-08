import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Your Windows desktop app talks to uvicorn running on your own machine.
  // (on an Android emulator this would need to be http://10.0.2.2:8000)
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

  /// Logs in. Returns the JWT token string on success, or null if the
  /// username/password is wrong.
  static Future<String?> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/token'),
      // NOTE: form-encoded, NOT JSON — see the explanation below.
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return data['access_token'] as String; // ← here's your token
    }
    return null; // wrong credentials (your API returns 401)
  }
}
