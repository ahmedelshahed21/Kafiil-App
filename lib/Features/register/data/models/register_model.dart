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
  final bool? gender;
  final int type;
  final String? avatar;  // This will be handled separately for file uploads
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

  Map<String, String> toJson() {
    final data = <String, String>{
      'first_name': firstName,
      'last_name': lastName,
      'about': about,
      'salary': salary.toString(),
      'password': password,
      'email': email,
      'birth_date': birthDate,
      'gender': gender != null ? (gender! ? '1' : '0') : '',
      'type': type.toString(),
      'password_confirmation': passwordConfirmation,
    };

    // Handle tags and favorite social media as lists
    // The handling of these lists may need to be adapted to the specific API requirements
    // For example, converting lists to a comma-separated string or similar

    return data;
  }

  // This method would need to be adapted to handle file uploads
  // For example, you might handle avatar uploads separately with FormData
  FormData toFormData() {
    final formData = FormData.fromMap({
      'first_name': firstName,
      'last_name': lastName,
      'about': about,
      'tags[]': tags,
      'favorite_social_media[]': favoriteSocialMedia,
      'salary': salary.toString(),
      'password': password,
      'email': email,
      'birth_date': birthDate,
      'gender': gender != null ? (gender! ? '1' : '0') : '',
      'type': type.toString(),
      'password_confirmation': passwordConfirmation,
    });

    if (avatar != null) {
      formData.fields.add(MapEntry('avatar', avatar!));
    }

    return formData;
  }
}
