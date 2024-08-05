import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil_app/Features/home/data/repos/countries_repo/countries_repo_impl.dart';
import 'package:kafiil_app/Features/home/data/repos/popular_products_repo/popular_products_repo_impl.dart';
import 'package:kafiil_app/Features/home/data/repos/products_repo/products_repo_impl.dart';
import 'package:kafiil_app/Features/home/presentation/manager/countries_cubit/countries_cubit.dart';
import 'package:kafiil_app/Features/home/presentation/manager/popular_products_cubit/popular_products_cubit.dart';
import 'package:kafiil_app/Features/home/presentation/manager/products_cubit/products_cubit.dart';
import 'package:kafiil_app/core/utils/app_router.dart';
import 'package:kafiil_app/core/utils/constants.dart';
import 'package:kafiil_app/core/utils/service_locator.dart';

class KafiilApp extends StatelessWidget {
  const KafiilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductsCubit(getIt.get<ProductsRepoImpl>())..fetchProducts()),
        BlocProvider(create: (context) => PopularProductsCubit(getIt.get<PopularProductsRepoImpl>())..fetchPopularProducts()),
        BlocProvider(create: (context)=>CountriesCubit(getIt.get<CountriesRepoImpl>())..fetchAllCountries())
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          colorScheme: const ColorScheme.light(
              primary: kPrimary900Color,
              secondary: kBackgroundColor
          ),
          appBarTheme: const AppBarTheme(
              backgroundColor: kBackgroundColor
          ),
          scaffoldBackgroundColor: kBackgroundColor,
        ),
      ),
    );
  }
}