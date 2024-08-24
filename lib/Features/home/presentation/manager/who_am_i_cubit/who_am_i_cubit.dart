import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil_app/Features/home/data/models/who_am_i_model.dart';
import 'package:kafiil_app/Features/home/data/repos/who_am_i_repo/who_am_i_repo.dart';
import 'package:kafiil_app/core/utils/errors/failure.dart';
import 'who_am_i_state.dart';

class WhoAmICubit extends Cubit<WhoAmIState> {
  final WhoAmIRepo whoAmIRepo;

  WhoAmICubit(this.whoAmIRepo) : super(WhoAmIInitialState());

  Future<void> fetchPersonalData() async {
    emit(WhoAmILoading());
    Either<Failure, WhoAmIModel> result = await whoAmIRepo.fetchPersonalDats();

    result.fold(
      (failure) => emit(WhoAmIFailure(failure.errMessage ?? 'UnKnown Error')),
      (whoAmI) => emit(WhoAmISuccess(whoAmI)),
    );
  }
}
