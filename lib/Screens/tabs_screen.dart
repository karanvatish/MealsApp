// ignore_for_file: unnecessary_const, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meals_app/Screens/category_screen.dart';
import 'package:meals_app/Screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {"page": CategoryScreen(), "title": "Categories"},
    {"page": FavoriteScreen(), "title": "Your Favorites"}
  ];

  int _selectedPageIndex = 0;

  void _setSelectedPageIndex(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meals App"),
      ),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category_rounded), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite")
        ],
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedPageIndex,
        onTap: _setSelectedPageIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        elevation: 6,
      ),
    );
  }
}
