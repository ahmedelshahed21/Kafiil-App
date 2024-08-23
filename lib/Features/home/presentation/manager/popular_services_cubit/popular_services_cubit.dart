import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil_app/Features/home/data/models/services_model.dart';
import 'package:kafiil_app/Features/home/data/repos/popular_services_repo/popular_services_repo_impl.dart';
import 'package:kafiil_app/Features/home/presentation/manager/popular_services_cubit/popular_services_state.dart';
import 'package:kafiil_app/core/utils/errors/failure.dart';



class PopularServicesCubit extends Cubit<PopularServicesState> {
  final PopularServicesRepoImpl popularProductsRepoImpl;

  PopularServicesCubit(this.popularProductsRepoImpl) : super(PopularServicesInitialState());

  Future<void> fetchPopularServices() async {
    emit(PopularServicesLoadingState());
    final Either<Failure, List<ServicesModel>> result = await popularProductsRepoImpl.fetchPopularServices();

    result.fold(
          (failure) {
        final errorMessage = _mapFailureToMessage(failure);
        print('Fetch Products Failure: $errorMessage');
        emit(PopularProductsFailureState(errorMessage));
      },
          (products) {
        print('Fetch Products Success: ${products.length} products');
        emit(PopularServicesSuccessState(products));
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
