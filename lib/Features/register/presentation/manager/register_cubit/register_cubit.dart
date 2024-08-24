import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil_app/Features/register/data/models/register_model/register_model.dart';
import 'package:kafiil_app/Features/register/data/repos/register_repos/register_repo.dart';
import 'package:kafiil_app/Features/register/presentation/manager/register_cubit/register_state.dart';


class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo _registerRepo;

  RegisterCubit(this._registerRepo) : super(RegisterInitialState());

  Future<void> registerUser(RegisterModel registerModel) async {
    emit(RegisterLoadingState());

    try {
      await _registerRepo.registerUser(registerModel);
      emit(RegisterSuccessState());
    } catch (error) {
      emit(RegisterFailureState(error.toString()));
    }
  }
}
