import 'package:flutter/material.dart';
import 'package:kafiil_app/core/theme/app_colors.dart';
import 'package:kafiil_app/core/routing/app_router.dart';


class KafiilApp extends StatelessWidget {
  const KafiilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
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
    );
  }
}


// BlocProvider(create: (context) => ServicesCubit(getIt.get<ServicesRepoImpl>())..fetchServices()),
// BlocProvider(create: (context) => PopularServicesCubit(getIt.get<PopularServicesRepoImpl>())..fetchPopularServices()),
// BlocProvider(create: (context)=>WhoAmICubit(getIt.get<WhoAmIRepoImpl>())..fetchPersonalData()),