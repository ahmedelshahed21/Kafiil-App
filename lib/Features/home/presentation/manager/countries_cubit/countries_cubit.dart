

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil_app/Features/home/data/models/country_model.dart';
import 'package:kafiil_app/Features/home/data/repos/countries_repo/countries_repo_impl.dart';
import 'package:kafiil_app/Features/home/presentation/manager/countries_cubit/countries_state.dart';
import 'package:kafiil_app/core/utils/errors/failure.dart';

class CountriesCubit extends Cubit<CountriesState> {
  final CountriesRepoImpl countriesRepoImpl;
  CountriesCubit(this.countriesRepoImpl) : super(CountriesInitial());

  Future<void> fetchAllCountries() async {
    emit(CountriesLoading());
    int currentPage = 1;
    List<CountryModel> allCountries = [];
    bool isLastPage = false;

    while (!isLastPage) {
      final Either<Failure, List<CountryModel>> result = await countriesRepoImpl.fetchCountries(currentPage);
      result.fold(
            (failure) {
          emit(CountriesError(failure));
          return;
        },
            (countries) {
          if (countries.isEmpty || countries.length < 10) {
            isLastPage = true;
          }
          allCountries.addAll(countries);
          currentPage++;
        },
      );
    }
    emit(CountriesLoaded(allCountries));
  }
}
