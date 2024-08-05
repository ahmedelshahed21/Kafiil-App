import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil_app/Features/home/data/repos/countries_repo/countries_repo_impl.dart';
import 'package:kafiil_app/Features/home/presentation/manager/countries_cubit/countries_cubit.dart';
import 'package:kafiil_app/Features/home/presentation/views/widgets/paginated_countries_table.dart';
import 'package:kafiil_app/core/utils/styles_app.dart';

class CountriesView extends StatelessWidget {
  const CountriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountriesCubit(CountriesRepoImpl()),
      child: const CountriesViewBody(),
    );
  }
}

class CountriesViewBody extends StatelessWidget {
  const CountriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 63, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Countries',
            style: StylesApp.styleSemiBold18(context),
          ),
          const SizedBox(height: 50),
          const Expanded(
            child: PaginatedCountriesTable(),
          ),
        ],
      ),
    );
  }
}






