import 'package:dartz/dartz.dart';
import 'package:kafiil_app/core/errors/failure.dart';
import 'package:kafiil_app/Features/home/data/models/who_am_i_model.dart';

abstract class WhoAmIRepo {
  Future<String?> getToken();
  Future<Either<Failure, WhoAmIModel>> fetchPersonalDats();
}
