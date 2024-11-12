import 'dart:developer';

import 'package:store_app/helper/api.dart';
import 'package:store_app/helper/constants.dart';

import '../models/product_model.dart';

class GetProductsService {
  Future<List<ProductModel>> getAllProductsCategori(
      {required String categorieName}) async {
    List<ProductModel> products = [];
    List<dynamic> data =
        await Api().get(url: '${baseUrl}products/category/$categorieName');

    for (var product in data) {
      products.add(ProductModel.fromJson(product));
    }
    log("Products Here!");
    return products;
  }
}
