import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:kafiil_app/Features/home/data/models/country_model.dart';
import 'package:kafiil_app/Features/home/data/repos/countries_repo/countries_repo.dart';
import 'package:kafiil_app/core/errors/failure.dart';

class CountriesRepoImpl implements CountriesRepo {
  final String apiUrl = 'https://test.kafiil.com/api/test/country';

  @override
  Future<Either<Failure, List<CountryModel>>> fetchCountries(int page) async {
    try {
      final response = await http.get(Uri.parse('$apiUrl?page=$page'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as Map<String, dynamic>;
        final List<dynamic> countriesJson = jsonData['data'] as List<dynamic>;

        final countries = countriesJson
            .map((json) => CountryModel.fromJson(json as Map<String, dynamic>))
            .toList();
        return Right(countries);
      } else {
        return Left(ServerFailure(errMessage: ''));
      }
    } catch (e) {
      return Left(ServerFailure(errMessage: ''));
    }
  }
}
