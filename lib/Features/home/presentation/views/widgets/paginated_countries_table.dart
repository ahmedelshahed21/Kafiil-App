import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil_app/Features/home/presentation/manager/countries_cubit/countries_cubit.dart';
import 'package:kafiil_app/Features/home/presentation/manager/countries_cubit/countries_state.dart';
import 'package:kafiil_app/Features/home/presentation/views/widgets/countries_loading_widget.dart';
import 'package:kafiil_app/Features/home/presentation/views/widgets/countries_table.dart';


class PaginatedCountriesTable extends StatelessWidget {
  const PaginatedCountriesTable({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountriesCubit, CountriesState>(
      builder: (context, state) {
        if (state is CountriesLoading) {
          return const CountriesLoadingWidget();
        } else if (state is CountriesLoaded) {
          return CountriesTable(countries: state.countries);
        } else if (state is CountriesError) {
          return Center(child: Text('Failed to load countries: ${state.failure}'));
        } else {
          context.read<CountriesCubit>().fetchAllCountries();
          return const CountriesLoadingWidget();
        }
      },
    );
  }
}

