import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil_app/Features/home/data/repos/countries_repo/countries_repo_impl.dart';
import 'package:kafiil_app/Features/home/presentation/manager/countries_cubit/countries_cubit.dart';
import 'package:kafiil_app/Features/home/presentation/views/widgets/countries_view_body.dart';

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








