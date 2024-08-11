import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:kafiil_app/Features/home/data/repos/countries_repo/countries_repo_impl.dart';
import 'package:kafiil_app/Features/home/data/repos/popular_products_repo/popular_products_repo_impl.dart';
import 'package:kafiil_app/Features/home/data/repos/products_repo/products_repo_impl.dart';
import 'package:kafiil_app/Features/home/data/repos/who_am_i_repo/who_am_i_repo_impl.dart';
import 'package:kafiil_app/core/utils/api_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator(){
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<WhoAmIRepoImpl>(WhoAmIRepoImpl());
  getIt.registerSingleton<ProductsRepoImpl>(ProductsRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<PopularProductsRepoImpl>(PopularProductsRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<CountriesRepoImpl>(CountriesRepoImpl());
}