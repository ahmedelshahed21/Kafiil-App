import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil_app/core/data/models/dependencies_model.dart';
import 'package:kafiil_app/core/data/repos/dependencies_repo.dart';

class SkillsCubit extends Cubit<SkillsState> {
  final DependenciesRepoImpl dependenciesRepo;

  SkillsCubit(this.dependenciesRepo) : super(SkillsLoading());

  Future<void> fetchDependencies() async {
    try {
      final dependencies = await dependenciesRepo.fetchDependencies();
      emit(SkillsLoaded(dependencies));
    } catch (error) {
      emit(SkillsError(error.toString()));
    }
  }
}

// States
abstract class SkillsState {}

class SkillsLoading extends SkillsState {}

class SkillsLoaded extends SkillsState {
  final DependenciesModel dependencies;
  SkillsLoaded(this.dependencies);
}

class SkillsError extends SkillsState {
  final String message;
  SkillsError(this.message);
}
