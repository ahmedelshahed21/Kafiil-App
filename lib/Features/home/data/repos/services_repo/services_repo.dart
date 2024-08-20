import 'package:dartz/dartz.dart';
import 'package:kafiil_app/Features/home/data/models/services_model.dart';
import 'package:kafiil_app/core/errors/failure.dart';

abstract class ServicesRepo{
  Future<Either<Failure,List<ServicesModel>>> fetchServices();
}