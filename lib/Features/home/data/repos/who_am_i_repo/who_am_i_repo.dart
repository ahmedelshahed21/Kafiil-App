import 'package:dartz/dartz.dart';
import 'package:kafiil_app/Features/home/data/models/who_am_i_model.dart';
import 'package:kafiil_app/core/utils/errors/failure.dart';

abstract class WhoAmIRepo {
  Future<String?> getToken();
  Future<Either<Failure, WhoAmIModel>> fetchPersonalDats();
}
