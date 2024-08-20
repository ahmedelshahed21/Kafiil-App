import 'package:kafiil_app/Features/register/data/models/register_model.dart';

abstract class RegisterRepo {
  Future<void> registerUser(RegisterModel registerModel);
}
