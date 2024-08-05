import 'package:kafiil_app/Features/home/data/models/product_model.dart';

abstract class PopularProductsState {}

class PopularProductsInitialState extends PopularProductsState  {}

class PopularProductsLoadingState extends PopularProductsState  {}

class PopularProductsSuccessState extends PopularProductsState  {
  final List<ProductModel> popularProducts;

  PopularProductsSuccessState(this.popularProducts);
}

class PopularProductsFailureState extends PopularProductsState {
  final String message;

  PopularProductsFailureState(this.message);
}
