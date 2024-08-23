import 'package:kafiil_app/Features/home/data/models/country_model.dart';
import 'package:kafiil_app/core/utils/errors/failure.dart';


abstract class CountriesState {}

class CountriesInitial extends CountriesState {}

class CountriesLoading extends CountriesState {}

class CountriesLoaded extends CountriesState {
  final List<CountryModel> countries;

  CountriesLoaded(this.countries);
}

class CountriesError extends CountriesState {
  final Failure failure;

  CountriesError(this.failure);
}
