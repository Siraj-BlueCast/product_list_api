
import 'package:flutter_product_list/models/product_model.dart';
import 'package:flutter_product_list/resources/api_provider.dart';

class ApiRepo {
  final _provider = ApiProvider();

  Future<List<ProductModel>> fetchProductList() async{
    return await _provider.fetchProductList();
  }
}

class NetworkError extends Error {
  
}