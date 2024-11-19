import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_products_service.dart';
import 'package:store_app/widget/grid_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String id = "home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New trend',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.cartPlus),
            onPressed: () {},
          ),
        ],
      ),
      body: FutureBuilder(
          future: getProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ProductGridView(
                products: snapshot.data!,
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }

  Future<List<ProductModel>> getProducts() async {
    var response = await GetProductsService().getAllProducts();
    return response;
  }
}
