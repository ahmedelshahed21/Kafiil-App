import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil_app/Features/home/data/repos/popular_services_repo/popular_services_repo_impl.dart';
import 'package:kafiil_app/Features/home/data/repos/services_repo/services_repo_impl.dart';
import 'package:kafiil_app/Features/home/data/repos/who_am_i_repo/who_am_i_repo_impl.dart';
import 'package:kafiil_app/Features/home/presentation/manager/popular_services_cubit/popular_services_cubit.dart';
import 'package:kafiil_app/Features/home/presentation/manager/services_cubit/services_cubit.dart';
import 'package:kafiil_app/Features/home/presentation/manager/who_am_i_cubit/who_am_i_cubit.dart';
import 'package:kafiil_app/core/theme/app_colors.dart';
import 'package:kafiil_app/core/utils/app_router.dart';
import 'package:kafiil_app/core/utils/service_locator.dart';

class KafiilApp extends StatelessWidget {
  const KafiilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ServicesCubit(getIt.get<ServicesRepoImpl>())..fetchServices()),
        BlocProvider(create: (context) => PopularServicesCubit(getIt.get<PopularServicesRepoImpl>())..fetchPopularServices()),
        BlocProvider(create: (context)=>WhoAmICubit(getIt.get<WhoAmIRepoImpl>())..fetchPersonalData()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          colorScheme: const ColorScheme.light(
              primary: AppColors.kPrimary900Color,
              secondary: AppColors.kBackgroundColor
          ),
          appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.kBackgroundColor
          ),
          scaffoldBackgroundColor: AppColors.kBackgroundColor
        ),
      ),
    );
  }
}