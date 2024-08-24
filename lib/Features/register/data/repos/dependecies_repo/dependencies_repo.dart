import 'package:dartz/dartz.dart';
import 'package:kafiil_app/Features/register/data/models/dependencies_model/dependencies_model.dart';
import 'package:kafiil_app/core/utils/errors/failure.dart';

abstract class DependenciesRepo {
  Future<Either<Failure, DependenciesModel>> fetchDependencies();
}