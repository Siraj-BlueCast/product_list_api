

import 'package:flutter_product_list/presentation/blocs/products/product_bloc.dart';
import 'package:flutter_product_list/data/repo/api_repo.dart';
import 'package:get_it/get_it.dart';
final getIt = GetIt.instance;
void setUpDI() {
  

  getIt.registerFactory(() => ApiRepo());
  getIt.registerLazySingleton(() => ProductBloc(getIt()));
}