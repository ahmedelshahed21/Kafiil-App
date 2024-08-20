import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:kafiil_app/Features/login/data/models/login_model.dart';
import 'package:kafiil_app/Features/login/data/repos/login_repo.dart';
import 'package:kafiil_app/core/constants/constants.dart';

class LoginRepoImpl implements LoginRepo {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  Future<void> loginUser(String userName, String password) async {
    final Map<String, dynamic> data = LoginModel(email: userName, password: password).toJson();
    final response = await http.post(
      Uri.parse('$baseUrl/api/test/user/login'),
      headers: {
        'Accept': 'application/json',
        'Accept-Language': 'ar',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      String? token = responseBody['access_token'];
      if (token != null) {
        await _storage.write(key: 'access_token', value: token);
      }
    } else {
      throw Exception('Failed to login');
    }
  }
}
