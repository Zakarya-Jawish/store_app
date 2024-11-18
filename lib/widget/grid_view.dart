import 'package:flutter/material.dart';
import 'package:store_app/widget/product_card.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

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
        itemBuilder: (context, index) => const ProductCard(),
        itemCount: 20,
      ),
    );
  }
}
