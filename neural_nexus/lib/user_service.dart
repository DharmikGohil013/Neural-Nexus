import 'package:http/http.dart' as http;
import 'dart:convert';

class UserService {
  static const String baseUrl = 'http://your-server-ip:4000';

  static Future<void> signup(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/signup'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );

    if (response.statusCode == 201) {
      return;
    } else {
      throw Exception(json.decode(response.body)['error']);
    }
  }
}