import 'package:flutter/material.dart';
import 'package:kafiil_app/core/utils/app_router.dart';
import 'package:kafiil_app/core/utils/constants.dart';

void main() {
  runApp(const KafiilApp());
}

class KafiilApp extends StatelessWidget {
  const KafiilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
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
    );
  }
}





