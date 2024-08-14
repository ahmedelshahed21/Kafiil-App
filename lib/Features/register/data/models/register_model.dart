import 'dart:io';

import 'package:dio/dio.dart';

class RegisterModel {
  final String firstName;
  final String lastName;
  final String about;
  final List<int> tags;
  final List<String> favoriteSocialMedia;
  final int salary;
  final String password;
  final String email;
  final String birthDate;
  final bool? gender; // optional
  final int type;
  final File? avatar; // optional
  final String passwordConfirmation;

  RegisterModel({
    required this.firstName,
    required this.lastName,
    required this.about,
    required this.tags,
    required this.favoriteSocialMedia,
    required this.salary,
    required this.password,
    required this.email,
    required this.birthDate,
    this.gender,
    required this.type,
    this.avatar,
    required this.passwordConfirmation,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['about'] = this.about;
    data['tags[]'] = this.tags;
    data['favorite_social_media[]'] = this.favoriteSocialMedia;
    data['salary'] = this.salary;
    data['password'] = this.password;
    data['email'] = this.email;
    data['birth_date'] = this.birthDate;
    data['gender'] = this.gender;
    data['type'] = this.type;
    data['password_confirmation'] = this.passwordConfirmation;

    if (this.avatar != null) {
      data['avatar'] = MultipartFile.fromFileSync(
        this.avatar!.path,
        filename: this.avatar!.path.split('/').last,
      );
    }

    return data;
  }
}
