import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kafiil_app/core/models/dependencies_model.dart';


abstract class DependenciesRepo {
  Future<DependenciesModel> fetchDependencies();
}

class DependenciesRepoImpl implements DependenciesRepo {
  final String apiUrl;
  final http.Client httpClient;

  DependenciesRepoImpl({required this.apiUrl, required this.httpClient});

  @override
  Future<DependenciesModel> fetchDependencies() async {
    final response = await httpClient.get(Uri.parse('https://test.kafiil.com/api/test/dependencies'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return DependenciesModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load dependencies');
    }
  }
}
