import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:kafiil_app/Features/home/data/models/services_model.dart';
import 'package:kafiil_app/Features/home/data/repos/services_repo/services_repo.dart';
import 'package:kafiil_app/core/utils/api_service.dart';
import 'package:kafiil_app/core/utils/errors/failure.dart';

class ServicesRepoImpl extends ServicesRepo {
  final ApiService apiService;
  ServicesRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<ServicesModel>>> fetchServices() async {
    try {
      var response = await apiService.get(endPoint:'service');
      print('API Response: $response');
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
