import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:kafiil_app/Features/home/data/models/who_am_i_model.dart';
import 'package:kafiil_app/Features/home/data/repos/who_am_i_repo/who_am_i_repo.dart';
import 'package:kafiil_app/core/constants/constants.dart';
import 'package:kafiil_app/core/errors/failure.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class WhoAmIRepoImpl implements WhoAmIRepo {

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  Future<String?> getToken()async {
    return await _storage.read(key: 'access_token');
  }

  @override
  Future<Either<Failure, WhoAmIModel>> fetchPersonalDats() async {

    String? token=await getToken();
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/test/user/who-am-i'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': '$token'
        },
      );

      print('API Response: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        if (responseData['data'] != null) {
          WhoAmIModel whoAmI = WhoAmIModel.fromJson(responseData['data']);
          return right(whoAmI);
        } else {
          return left(ServerFailure(errMessage: 'No data found in response'));
        }
      } else {
        return left(ServerFailure(errMessage: 'Failed to fetch data. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      print('Exception: $e');
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
