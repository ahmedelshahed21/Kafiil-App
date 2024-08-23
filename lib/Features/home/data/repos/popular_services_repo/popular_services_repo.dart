import 'package:dartz/dartz.dart';
import 'package:kafiil_app/Features/home/data/models/services_model.dart';
import 'package:kafiil_app/core/utils/errors/failure.dart';


abstract class PopularServicesRepo{
  Future<Either<Failure,List<ServicesModel>>> fetchPopularServices();
}