import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kafiil_app/Features/home/data/models/product_model.dart';
import 'package:kafiil_app/Features/home/data/repos/products_repo/products_repo.dart';
import 'package:kafiil_app/core/errors/failure.dart';
import 'package:kafiil_app/core/utils/api_service.dart';

class ProductsRepoImpl extends ProductsRepo {
  final ApiService apiService;
  ProductsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<ProductModel>>> fetchProducts() async {
    try {
      var response = await apiService.get(endPoint:'service'); // Ensure this is the correct endpoint
      print('API Response: $response'); // Log the API response

      // Check if response contains 'data' key
      if (response['data'] != null) {
        List<ProductModel> products = [];
        for (var item in response['data']) {
          products.add(ProductModel.fromJson(item));
        }
        return right(products);
      } else {
        return left(ServerFailure(errMessage: 'No data found in response'));
      }
    } catch (e) {
      if (e is DioException) {
        print('DioException: ${e.message}');
        if (e.response != null) {
          print('Response Data: ${e.response!.data}');
          print('Response Status: ${e.response!.statusCode}');
        }
        return left(ServerFailure.fromDioException(e));
      } else {
        print('Exception: $e');
        return left(ServerFailure(errMessage: e.toString()));
      }
    }
  }
}
