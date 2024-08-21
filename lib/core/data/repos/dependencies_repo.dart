import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kafiil_app/core/constants/constants.dart';
import 'package:kafiil_app/core/data/models/dependencies_model.dart';



abstract class DependenciesRepo {
  Future<DependenciesModel> fetchDependencies();
}

class DependenciesRepoImpl implements DependenciesRepo {
  DependenciesRepoImpl();
  @override
  Future<DependenciesModel> fetchDependencies() async {
    final response = await http.get(Uri.parse('$baseUrl/api/test/dependencies'));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return DependenciesModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load dependencies');
    }
  }
}
