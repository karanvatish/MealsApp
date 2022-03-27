import 'package:flutter/material.dart';
import 'package:meals_app/Widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  const CategoryMealScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String? categoryTitle = routeArg['title'];
    final String? categoryId = routeArg['id'];
    final categoryMeal = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle!)),
        body: ListView.builder(
          itemBuilder: (context, index) => MealItem(meal: categoryMeal[index]),
          itemCount: categoryMeal.length,
        ));
  }
}
