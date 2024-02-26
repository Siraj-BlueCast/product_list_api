import 'package:flutter_product_list/domain/models/product_model.dart';

abstract class ProductListRepo
 {
  Future<List<ProductModel>> fetchProductList();
}