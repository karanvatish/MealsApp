import 'package:flutter/material.dart';

class MealDetails extends StatelessWidget {
  static const routeName = '/meal-items/details';
  const MealDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test")),
      body: Text('Testssdss'),
    );
  }
}
