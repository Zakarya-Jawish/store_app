import 'dart:developer';

import 'package:store_app/models/product_model.dart';

import '../helper/api.dart';
import '../helper/constants.dart';

class GetProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    List<ProductModel> products = [];
    List<dynamic> data = await Api().get(url: '${baseUrl}products');
    for (var product in data) {
      products.add(ProductModel.fromJson(product));
    }
    log("Products Here!");
    return products;
  }
}
