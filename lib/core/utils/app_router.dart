import 'package:go_router/go_router.dart';
import 'package:kafiil_app/features/home/presentation/views/home_view.dart';
import 'package:kafiil_app/features/login/presentation/views/login_view.dart';
import 'package:kafiil_app/features/register/presentation/views/register_view.dart';

abstract class AppRouter{
  static const kRegisterView='/registerView';
  static const kHomeView='/homeView';
  static final router=GoRouter(
      routes: [
        GoRoute(
            path: '/',
            builder: (context,state) => const LoginView()
        ),
        GoRoute(
            path: kRegisterView,
            builder: (context,state) => const RegisterView()
        ),
        GoRoute(
            path: kHomeView,
            builder: (context,state) => HomeView()
        ),
      ]
  );

}