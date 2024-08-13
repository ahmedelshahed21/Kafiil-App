class WhoAmIModel {
  final int id;
  final String firstName;
  final String lastName;
  final String about;
  final List<Tag> tags;
  final List<String> favoriteSocialMedia;
  final int salary;
  final String email;
  final String birthDate;
  final int gender;
  final UserType type;
  final String avatar;

  WhoAmIModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.about,
    required this.tags,
    required this.favoriteSocialMedia,
    required this.salary,
    required this.email,
    required this.birthDate,
    required this.gender,
    required this.type,
    required this.avatar,
  });

  factory WhoAmIModel.fromJson(Map<String, dynamic> json) {
    return WhoAmIModel(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      about: json['about'],
      tags: List<Tag>.from(json['tags'].map((tag) => Tag.fromJson(tag))),
      favoriteSocialMedia: List<String>.from(json['favorite_social_media']),
      salary: json['salary'],
      email: json['email'],
      birthDate: json['birth_date'],
      gender: json['gender'],
      type: UserType.fromJson(json['type']),
      avatar: json['avatar'],
    );
  }
}

class Tag {
  final int id;
  final String name;

  Tag({
    required this.id,
    required this.name,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      id: json['id'],
      name: json['name'],
    );
  }
}

class UserType {
  final int code;
  final String name;
  final String niceName;

  UserType({
    required this.code,
    required this.name,
    required this.niceName,
  });

  factory UserType.fromJson(Map<String, dynamic> json) {
    return UserType(
      code: json['code'],
      name: json['name'],
      niceName: json['nice_name'],
    );
  }
}
