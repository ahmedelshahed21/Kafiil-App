import 'package:kafiil_app/Features/home/data/models/services_model.dart';

abstract class ServicesState {}

class ServicesInitialState extends ServicesState  {}

class ServicesLoadingState extends ServicesState  {}

class ServicesSuccessState extends ServicesState  {
  final List<ServicesModel> services;

  ServicesSuccessState(this.services);
}

class ServicesFailureState extends ServicesState {
  final String message;

  ServicesFailureState(this.message);
}
