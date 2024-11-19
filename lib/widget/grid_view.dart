import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/widget/product_card.dart';

class ProductGridView extends StatelessWidget {
  ProductGridView({super.key, required this.products});
  List<ProductModel> products = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 60),
      child: GridView.builder(
        clipBehavior: Clip.none,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          mainAxisSpacing: 20,
          crossAxisSpacing: 5,
        ),
        itemBuilder: (context, index) => ProductCard(
          product: products[index],
        ),
        itemCount: products.length,
      ),
    );
  }
}
