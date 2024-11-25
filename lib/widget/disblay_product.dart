// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../services/get_all_products_categorie.dart';
import '../services/get_all_products_service.dart';
import 'grid_view.dart';

class DisblayProduct extends StatelessWidget {
  DisblayProduct({
    super.key,
    this.categoryNamw,
  });
  final String? categoryNamw;

  var future;
  static final Map<String?, List<ProductModel>> _categoryCache = {};

  @override
  Widget build(BuildContext context) {
    if (!_categoryCache.containsKey(categoryNamw)) {
      future = categoryNamw != null
          ? getProductsByCategory(category: categoryNamw!)
          : getProducts();
    }
    if (_categoryCache.containsKey(categoryNamw)) {
      return ProductGridView(products: _categoryCache[categoryNamw]!);
    }

    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final products = snapshot.data! as List<ProductModel>;
            _categoryCache[categoryNamw] = products;
            return ProductGridView(
              products: products,
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }

  Future<List<ProductModel>> getProducts() async {
    var response = await GetProductsService().getAllProducts();
    return response;
  }

  Future<List<ProductModel>> getProductsByCategory(
      {required String category}) async {
    var response = await GetProductsByCategoriService()
        .getProductsbyCategory(categorieName: category);
    return response;
  }
}
