import 'dart:developer';

import 'package:store_app/helper/api.dart';

import '../models/product_model.dart';

class GetProductCategorisService {
  Future<List<ProductModel>> getAllProductsCategori(
      {required String categorieName}) async {
    List<ProductModel> products = [];
    List<dynamic> data =
        await Api().get(url: 'products/category/$categorieName');

    for (var product in data) {
      products.add(ProductModel.fromJson(product));
    }
    log("Products Here!");
    return products;
  }
}
