class RegisterModel {
  final String firstName;
  final String lastName;
  final String about;
  //final List<double> tags;
  //final List<String> favoriteSocialMedia;
  final int salary;
  final String password;
  final String email;
  final String birthDate;
  final bool? gender;
  final int type;
  final String passwordConfirmation;
  //final File avatar;

  RegisterModel({
    required this.firstName,
    required this.lastName,
    required this.about,
    //required this.tags,
    //required this.favoriteSocialMedia,
    required this.salary,
    required this.password,
    required this.email,
    required this.birthDate,
    this.gender,
    required this.type,
    required this.passwordConfirmation,
  });

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'about': about,
      //'tags[]': tags,
      //'favorite_social_media[]': favoriteSocialMedia,
      'salary': salary,
      'password': password,
      'email': email,
      'birth_date': birthDate,
      'gender': gender,
      'type': type,
      'password_confirmation': passwordConfirmation,
    };
  }
}
