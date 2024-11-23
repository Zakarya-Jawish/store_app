import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../services/get_all_products_categorie.dart';
import '../services/get_all_products_service.dart';
import 'grid_view.dart';

class DisblayProduct extends StatelessWidget {
  const DisblayProduct({super.key, this.categoryNamw});
  final String? categoryNamw;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: categoryNamw != null
            ? getProductsByCategory(category: categoryNamw!)
            : getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ProductGridView(
              products: snapshot.data!,
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
