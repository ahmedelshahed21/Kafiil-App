import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kafiil_app/Features/home/data/models/services_model.dart';
import 'package:kafiil_app/Features/home/data/repos/popular_services_repo/popular_services_repo.dart';
import 'package:kafiil_app/core/utils/api_service.dart';
import 'package:kafiil_app/core/utils/errors/failure.dart';

class PopularServicesRepoImpl extends PopularServicesRepo {
  final ApiService apiService;
  PopularServicesRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<ServicesModel>>> fetchPopularServices() async {
    try {
      var response = await apiService.get(endPoint:'service/popular');
      print('API Response: $response'); // Log the API response

      // Check if response contains 'data' key
      if (response['data'] != null) {
        List<ServicesModel> products = [];
        for (var item in response['data']) {
          products.add(ServicesModel.fromJson(item));
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
