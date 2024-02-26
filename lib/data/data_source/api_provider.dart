
import 'package:dio/dio.dart';
import 'package:flutter_product_list/core/network/dio_client.dart';
import 'package:flutter_product_list/core/network/dio_state.dart';

import 'package:flutter_product_list/domain/models/product_model.dart';
import 'package:flutter_product_list/domain/repo/product_list_repo.dart';

class ApiProvider implements ProductListRepo{
  final Dio dio;
  ApiProvider({required this.dio});
  //final String url = 'https://dummyjson.com/products';

  @override
  Future<List<ProductModel>> fetchProductList() async{
    DioClient dioClient = DioClient(dio);
    DioState state = await dioClient.get('products');
    // try {
    //   Response response = await 
    //   dio.get(url);
    // print(response.data['products']);
     if (state is DioSuccess) {
    List<dynamic> productListJson = state.data['products'];
    List<ProductModel> productList = productListJson.map((e) => ProductModel.fromJson(e)).toList();
    return productList;
     }else {
      throw Exception((state as DioFailed).error);
     }
    // } catch (e) {
    //  print('Exception: $e ');
    // final ProductModel result =  ProductModel.withError("Data not found / Connection Lost");
    //   return [result];
    // }
  }
}