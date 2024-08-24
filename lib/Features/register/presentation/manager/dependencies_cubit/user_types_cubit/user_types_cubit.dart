import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil_app/Features/register/data/models/dependencies_model/dependencies_model.dart';
import 'package:kafiil_app/Features/register/data/repos/dependecies_repo/dependencies_repo_impl.dart';


class UserTypesCubit extends Cubit<UserTypesState> {
  final DependenciesRepo dependenciesRepo;

  UserTypesCubit({required this.dependenciesRepo}) : super(DependenciesInitial());

  Future<void> fetchDependencies() async {
    try {
      emit(DependenciesLoading());
      final dependencies = await dependenciesRepo.fetchDependencies();
      emit(DependenciesLoaded(dependencies));
    } catch (error) {
      emit(DependenciesError(error.toString()));
    }
  }
}

abstract class UserTypesState {}

class DependenciesInitial extends UserTypesState {}

class DependenciesLoading extends UserTypesState {}

class DependenciesLoaded extends UserTypesState {
  final DependenciesModel dependencies;

  DependenciesLoaded(this.dependencies);
}

class DependenciesError extends UserTypesState {
  final String message;

  DependenciesError(this.message);
}
