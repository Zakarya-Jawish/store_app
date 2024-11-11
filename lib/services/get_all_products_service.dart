import 'dart:developer';

import 'package:store_app/models/product_model.dart';
import 'package:dio/dio.dart';

import '../helper/constants.dart';

class GetProductsService {
  Future<List<ProductModel>> getAllProducts({String? categorieName}) async {
    try {
      List<ProductModel> products = [];
      Dio dio = Dio();
      Response response;
      if (categorieName == null) {
        response = await dio.get('${baseUrl}products');
      } else {
        response = await dio.get('${baseUrl}products/category/$categorieName');
      }
      if (response.statusCode == 200) {
        for (var product in response.data) {
          products.add(ProductModel.fromJson(product));
        }
        log("Products Here!");
        return products;
      } else {
        throw Exception("Wrong Status Code: ${response.statusCode}");
      }
    } on Exception catch (e) {
      log(e.toString());
      return [];
    }
  }
}
