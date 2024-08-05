import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final String _baseUrl='https://test.kafiil.com/api/test';
  ApiService(this._dio);

  Future<Map<String,dynamic>> get({String? endPoint})async{
    var response = await _dio.get('$_baseUrl/$endPoint');
    print(response.statusCode);
    return response.data;
  }
}