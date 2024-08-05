import 'package:kafiil_app/Features/home/data/models/product_model.dart';

abstract class ProductsState {}

class ProductsInitialState extends ProductsState  {}

class ProductsLoadingState extends ProductsState  {}

class ProductsSuccessState extends ProductsState  {
  final List<ProductModel> products;

  ProductsSuccessState(this.products);
}

class ProductsFailureState extends ProductsState {
  final String message;

  ProductsFailureState(this.message);
}
