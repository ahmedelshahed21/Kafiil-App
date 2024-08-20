import 'package:kafiil_app/Features/home/data/models/services_model.dart';

abstract class PopularServicesState {}

class PopularServicesInitialState extends PopularServicesState  {}

class PopularServicesLoadingState extends PopularServicesState  {}

class PopularServicesSuccessState extends PopularServicesState  {
  final List<ServicesModel> popularProducts;

  PopularServicesSuccessState(this.popularProducts);
}

class PopularProductsFailureState extends PopularServicesState {
  final String message;

  PopularProductsFailureState(this.message);
}
