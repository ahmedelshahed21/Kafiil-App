import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kafiil_app/Features/register/data/models/register_model.dart';
import 'package:kafiil_app/Features/register/data/repos/register_repo.dart';
import 'package:kafiil_app/core/constants/constants.dart';


class RegisterRepoImpl implements RegisterRepo {
  @override
  Future<void> registerUser(RegisterModel registerModel) async {
    final uri = Uri.parse('$baseUrl/api/test/user/register');

    final request = http.MultipartRequest('POST', uri)
      ..headers['Accept'] = 'application/json'
      ..headers['Accept-Language'] = 'ar'
      ..headers['Content-Type'] = 'multipart/form-data';

    // Populate fields
    request.fields['first_name'] = registerModel.firstName;
    request.fields['last_name'] = registerModel.lastName;
    request.fields['about'] = registerModel.about;

    // Add tags
    for (var tag in registerModel.tags) {
      request.fields['tags[]'] = tag.toString();
    }

    // Add favorite social media
    for (var socialMedia in registerModel.favoriteSocialMedia) {
      request.fields['favorite_social_media[]'] = socialMedia;
    }

    request.fields['salary'] = registerModel.salary.toString();
    request.fields['password'] = registerModel.password;
    request.fields['email'] = registerModel.email;
    request.fields['birth_date'] = registerModel.birthDate;

    if (registerModel.gender != null) {
      request.fields['gender'] = registerModel.gender! ? '1' : '0';
    }

    request.fields['type'] = registerModel.type.toString();
    request.fields['password_confirmation'] = registerModel.passwordConfirmation;

    // Add avatar file if available
    if (registerModel.avatar != null) {
      request.files.add(await http.MultipartFile.fromPath('avatar', registerModel.avatar!.path));
    }

    final response = await request.send();
    final responseBody = await response.stream.bytesToString();

    if (response.statusCode != 200) {
      final Map<String, dynamic> responseData = json.decode(responseBody);
      if (responseData.containsKey('errors')) {
        final errors = responseData['errors'];
        String firstErrorMessage;

        if (errors is Map) {
          firstErrorMessage = errors.values.first[0];
        } else if (errors is List) {
          firstErrorMessage = errors.first.toString();
        } else {
          firstErrorMessage = 'Unknown error occurred';
        }

        throw Exception(firstErrorMessage);
      } else {
        return responseData['message'] ?? 'Registration failed';
      }
    }
  }
}
