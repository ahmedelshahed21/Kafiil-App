import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil_app/Features/home/data/models/product_model.dart';
import 'package:kafiil_app/Features/home/data/repos/popular_products_repo/popular_products_repo_impl.dart';
import 'package:kafiil_app/Features/home/presentation/manager/popular_products_cubit/popular_products_state.dart';
import 'package:kafiil_app/core/errors/failure.dart';


class PopularProductsCubit extends Cubit<PopularProductsState> {
  final PopularProductsRepoImpl popularProductsRepoImpl;

  PopularProductsCubit(this.popularProductsRepoImpl) : super(PopularProductsInitialState());

  Future<void> fetchPopularProducts() async {
    emit(PopularProductsLoadingState());
    final Either<Failure, List<ProductModel>> result = await popularProductsRepoImpl.fetchPopularProducts();

    result.fold(
          (failure) {
        final errorMessage = _mapFailureToMessage(failure);
        print('Fetch Products Failure: $errorMessage');
        emit(PopularProductsFailureState(errorMessage));
      },
          (products) {
        print('Fetch Products Success: ${products.length} products');
        emit(PopularProductsSuccessState(products));
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
