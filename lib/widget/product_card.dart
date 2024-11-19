import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';

class ProductCard extends StatelessWidget {
  ProductCard({super.key, required this.product});
  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * 0.45,
          height: MediaQuery.sizeOf(context).height * 0.16,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.grey.withOpacity(.2), //.2==0.2
                spreadRadius: 0,
                offset: const Offset(10, 10),
              ),
            ],
          ),
          child: Card(
            color: Colors.white,
            // elevation: 7, we can use this or add shadow box by container for more control
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(
                        fontSize: 15, overflow: TextOverflow.ellipsis),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${product.price}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
            // bottom: 60,
            top: -65,
            right: 30,
            child: Image.network(
              product.image,
              height: 120,
              width: 100,
            )),
      ],
    );
  }
}
