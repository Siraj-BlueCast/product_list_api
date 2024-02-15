
import 'package:dio/dio.dart';

import 'package:flutter_product_list/models/product_model.dart';

class ApiProvider {
  final dio = Dio();
  final String url = 'https://dummyjson.com/products';

  Future<List<ProductModel>> fetchProductList() async{
    try {
      Response response = await 
      dio.get(url);
    // print(response.data['products']);
     if (response.statusCode == 200) {
    List<dynamic> productListJson = response.data['products'];
    List<ProductModel> productList = productListJson.map((e) => ProductModel.fromJson(e)).toList();
    return productList;
     }else {
      throw Exception(response.statusCode);
     }
    } catch (e) {
     print('Exception: $e ');
    final ProductModel result =  ProductModel.withError("Data not found / Connection Lost");
      return [result];
    }
  }
}