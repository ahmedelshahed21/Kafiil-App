import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil_app/Features/register/data/models/dependencies_model/dependencies_model.dart';
import 'package:kafiil_app/Features/register/data/repos/dependecies_repo/dependencies_repo_impl.dart';



class SocialMediaCubit extends Cubit<SocialMediaState> {
  final DependenciesRepoImpl _dependenciesRepo;

  SocialMediaCubit(this._dependenciesRepo) : super(SocialMediaLoading());

  Future<void> fetchSocialMedia() async {
    try {
      final dependencies = await _dependenciesRepo.fetchDependencies();
      emit(SocialMediaLoaded(dependencies.socialMedia));
    } catch (error) {
      emit(SocialMediaError(error.toString()));
    }
  }
}

// States
abstract class SocialMediaState {}

class SocialMediaLoading extends SocialMediaState {}

class SocialMediaLoaded extends SocialMediaState {
  final List<SocialMediaModel> socialMedia;
  SocialMediaLoaded(this.socialMedia);
}

class SocialMediaError extends SocialMediaState {
  final String message;
  SocialMediaError(this.message);
}
