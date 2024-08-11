import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:kafiil_app/Features/login/data/models/login_model.dart';
import 'package:kafiil_app/Features/login/presentation/manager/login_cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  Future<void> loginUser(String email, String password) async {
    emit(LoginLoadingState());

    final Map<String, dynamic> data = LoginModel(email: email, password: password).toJson();
    final response = await http.post(
      Uri.parse('https://test.kafiil.com/api/test/user/login'),
      headers: {
        'Accept': 'application/json',
        'Accept-Language': 'ar',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      emit(LoginSuccess());
    } else {
      emit(LoginFailure());
    }
  }
}
