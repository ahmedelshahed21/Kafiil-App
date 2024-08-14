import 'package:dio/dio.dart';

class RegisterStepContentModel {
  String firstName;
  String lastName;
  String email;
  String password;
  String passwordConfirmation;
  int type;
  RegisterStepContentModel({
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.email,
    required this.passwordConfirmation,
    required this.type
  });

  Map<String, String> toJson() {
    final data = <String, String>{
      'first_name': firstName,
      'last_name': lastName,
      'password': password,
      'email': email,
      'type': type.toString(),
      'password_confirmation': passwordConfirmation,
    };



    return data;
  }


  FormData toFormData() {
    final formData = FormData.fromMap({
      'first_name': firstName,
      'last_name': lastName,
      'password': password,
      'email': email,
      'type': type.toString(),
      'password_confirmation': passwordConfirmation,
    });
    return formData;
  }
}
