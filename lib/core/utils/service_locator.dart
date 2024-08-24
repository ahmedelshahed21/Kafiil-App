import 'package:get_it/get_it.dart';
import 'package:kafiil_app/Features/home/data/repos/popular_services_repo/popular_services_repo_impl.dart';
import 'package:kafiil_app/Features/home/data/repos/services_repo/services_repo_impl.dart';
import 'package:kafiil_app/core/utils/api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator(){
  getIt.registerSingleton<ServicesRepoImpl>(ServicesRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<PopularServicesRepoImpl>(PopularServicesRepoImpl(getIt.get<ApiService>()));
}