import 'package:kafiil_app/Features/home/data/models/who_am_i_model.dart';

abstract class WhoAmIState {}

class WhoAmIInitialState extends WhoAmIState {}

class WhoAmILoading extends WhoAmIState {}

class WhoAmISuccess extends WhoAmIState {
  final WhoAmIModel whoAmI;
  WhoAmISuccess(this.whoAmI);
}

class WhoAmIFailure extends WhoAmIState {
  final String error;

  WhoAmIFailure(this.error);
}
