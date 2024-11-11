import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:store_app/helper/constants.dart';
import 'package:store_app/models/categorie_model.dart';

class GetAllCategoriesService {
  Future<List<CategorieModel>> getAllCategories() async {
    try {
      List<CategorieModel> categories = [];
      Dio dio = Dio();
      Response response = await dio.get('${baseUrl}products/categories');
      if (response.statusCode == 200) {
        for (String categorie in response.data) {
          categories.add(CategorieModel(name: categorie));
        }
        log("all categories here!");
        return categories;
      } else {
        throw Exception("Wrong Status Code: ${response.statusCode}");
      }
    } on Exception catch (e) {
      print(e.toString());
      return [];
    }
  }
}
