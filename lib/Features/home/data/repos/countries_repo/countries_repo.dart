import 'package:dartz/dartz.dart';
import 'package:kafiil_app/Features/home/data/models/country_model.dart';
import 'package:kafiil_app/core/errors/failure.dart';

abstract class CountriesRepo{
  Future<Either<Failure,List<CountryModel>>> fetchCountries(int page);
}