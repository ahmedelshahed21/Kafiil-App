import 'package:dartz/dartz.dart';
import 'package:kafiil_app/Features/home/data/models/product_model.dart';
import 'package:kafiil_app/core/errors/failure.dart';

abstract class PopularProductsRepo{
  Future<Either<Failure,List<ProductModel>>> fetchPopularProducts();
}