// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:meals_app/Screens/category_screen.dart';
import 'package:meals_app/Screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Meals App"),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.category_rounded), text: "Category"),
              Tab(icon: Icon(Icons.favorite), text: "Favorite"),
            ],
          ),
        ),
        body: TabBarView(children: [CategoryScreen(), FavoriteScreen()]),
      ),
    );
  }
}
