import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kafiil_app/Features/home/data/models/product_model.dart';
import 'package:kafiil_app/Features/home/data/repos/products_repo/products_repo_impl.dart';
import 'package:kafiil_app/core/errors/failure.dart';
import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepoImpl productsRepo;

  ProductsCubit(this.productsRepo) : super(ProductsInitialState());

  Future<void> fetchProducts() async {
    emit(ProductsLoadingState());
    final Either<Failure, List<ProductModel>> result = await productsRepo.fetchProducts();

    result.fold(
          (failure) {
        final errorMessage = _mapFailureToMessage(failure);
        print('Fetch Products Failure: $errorMessage');
        emit(ProductsFailureState(errorMessage));
      },
          (products) {
        print('Fetch Products Success: ${products.length} products');
        emit(ProductsSuccessState(products));
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
