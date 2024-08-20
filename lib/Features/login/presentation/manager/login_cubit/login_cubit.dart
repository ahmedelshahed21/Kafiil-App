import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil_app/Features/login/data/repos/login_repo.dart';
import 'package:kafiil_app/Features/login/presentation/manager/login_cubit/login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(LoginInitialState());

  Future<void> loginUser(String email, String password) async {
    emit(LoginLoadingState());

    try {
      await _loginRepo.loginUser(email, password);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure());
    }
  }
}
