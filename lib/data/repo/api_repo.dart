
import 'package:dio/dio.dart';
import 'package:flutter_product_list/domain/models/product_model.dart';
import 'package:flutter_product_list/data/data_source/api_provider.dart';

class ApiRepo {
  final _provider = ApiProvider(dio: Dio());

  Future<List<ProductModel>> fetchProductList() async{
    return await _provider.fetchProductList();
  }
}

class NetworkError extends Error {
  
}