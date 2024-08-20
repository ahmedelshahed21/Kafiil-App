import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil_app/Features/home/data/models/services_model.dart';
import 'package:kafiil_app/Features/home/data/repos/services_repo/services_repo_impl.dart';
import 'package:kafiil_app/core/errors/failure.dart';
import 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  final ServicesRepoImpl productsRepo;

  ServicesCubit(this.productsRepo) : super(ServicesInitialState());

  Future<void> fetchServices() async {
    emit(ServicesLoadingState());
    final Either<Failure, List<ServicesModel>> result = await productsRepo.fetchServices();

    result.fold(
          (failure) {
        final errorMessage = _mapFailureToMessage(failure);
        print('Fetch Products Failure: $errorMessage');
        emit(ServicesFailureState(errorMessage));
      },
          (products) {
        print('Fetch Products Success: ${products.length} products');
        emit(ServicesSuccessState(products));
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return failure.errMessage.toString();
    } else {
      return "Unexpected error";
    }
  }
}
