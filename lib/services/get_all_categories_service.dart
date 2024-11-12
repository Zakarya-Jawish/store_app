import 'dart:developer';

import 'package:store_app/helper/constants.dart';
import 'package:store_app/models/categorie_model.dart';

import '../helper/api.dart';

class GetAllCategoriesService {
  Future<List<CategorieModel>> getAllCategories() async {
    List<dynamic> data = await Api().get(url: '${baseUrl}products/categories');
    List<CategorieModel> categories = [];
    for (String categorie in data) {
      categories.add(CategorieModel(name: categorie));
    }
    log("all categories here!");

    return categories;
  }
}
