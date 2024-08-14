import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:kafiil_app/Features/register/data/models/register_model.dart';
import 'dart:convert';
import 'package:kafiil_app/Features/register/presentation/manager/register_cubit/register_state.dart';
import 'package:kafiil_app/core/utils/constants.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  Future<void> registerUser(RegisterModel registerModel) async {
    emit(RegisterLoadingState());

    try {
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
      registerModel.tags.forEach((tag) {
        request.fields['tags[]'] = tag.toString();
      });

      // Add favorite social media
      registerModel.favoriteSocialMedia.forEach((socialMedia) {
        request.fields['favorite_social_media[]'] = socialMedia;
      });

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

      print('Response Body: $responseBody');

      if (response.statusCode == 200) {
        emit(RegisterSuccessState());
      } else {
        final Map<String, dynamic> responseData = json.decode(responseBody);

        if (responseData.containsKey('errors')) {
          // Assuming 'errors' is a map or a list of errors
          final errors = responseData['errors'];
          String firstErrorMessage;

          if (errors is Map) {
            // Extract the first error message from the map
            firstErrorMessage = errors.values.first[0];
          } else if (errors is List) {
            // If errors is a list, take the first message
            firstErrorMessage = errors.first.toString();
          } else {
            // Fallback error message
            firstErrorMessage = 'Unknown error occurred';
          }

          emit(RegisterFailureState(firstErrorMessage));
        } else {
          emit(RegisterFailureState(responseData['message'] ?? 'Registration failed'));
        }
      }
    } catch (error) {
      emit(RegisterFailureState(error.toString()));
    }
  }
}
