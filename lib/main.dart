import 'package:flutter/material.dart';
import 'package:store_app/views/update_product_view.dart';

import 'views/home_view.dart';

void main() async {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeView.id: (context) => const HomeView(),
        UpdateProductView.id: (context) => const UpdateProductView(),
      },
      initialRoute: HomeView.id,
    );
  }
}
