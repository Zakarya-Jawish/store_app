import 'package:flutter/material.dart';

import 'services/get_all_products_service.dart';

void main() async {
  await GetProductsService().getAllProducts();
  //await GetAllCategoriesService().getAllCategories();

  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(),
    );
  }
}
