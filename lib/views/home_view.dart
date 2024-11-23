import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widget/custom_tab_bar.dart';
import '../widget/disblay_product.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String id = "home";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
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
          bottom: customTabBar(),
        ),
        body: const TabBarView(children: [
          DisblayProduct(),
          DisblayProduct(categoryNamw: 'electronics'),
          DisblayProduct(categoryNamw: 'jewelery'),
          DisblayProduct(categoryNamw: 'men\'s clothing'),
          DisblayProduct(categoryNamw: 'women\'s clothing'),
        ]),
      ),
    );
  }
}
