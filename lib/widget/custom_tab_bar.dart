import 'package:flutter/material.dart';

TabBar customTabBar() {
  return const TabBar(isScrollable: true, tabs: [
    Tab(child: Text('All')),
    Tab(child: Text('electronics')),
    Tab(child: Text('jewelery')),
    Tab(child: Text('men\'s clothing')),
    Tab(child: Text('women\'s clothing')),
  ]);
}
