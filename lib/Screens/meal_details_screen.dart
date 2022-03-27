import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-items/details';
  const MealDetailsScreen({Key? key}) : super(key: key);

  List<Widget> buildSectionTile(
      MediaQueryData mediaQueryData, BuildContext context, String title) {
    return [
      SizedBox(
        height: mediaQueryData.size.height * 0.02,
      ),
      Text(
        title,
        style: Theme.of(context).textTheme.headline1,
        textAlign: TextAlign.center,
      ),
      SizedBox(
        height: mediaQueryData.size.height * 0.02,
      ),
    ];
  }

  Widget buildSectionDetails(MediaQueryData mediaQueryData, Widget child) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(color: Colors.grey),
      ),
      padding: const EdgeInsets.all(15),
      height: mediaQueryData.size.height * .2,
      width: mediaQueryData.size.width * .8,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final meal = DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('${meal.title}')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: mediaQueryData.size.height * .4,
              width: double.infinity,
              child: Image.network(meal.imageUrl, fit: BoxFit.cover),
            ),
            ...buildSectionTile(mediaQueryData, context, "Ingredients"),
            buildSectionDetails(
              mediaQueryData,
              ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Text(
                      meal.ingredients[index],
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  );
                },
                itemCount: meal.ingredients.length,
              ),
            ),
            ...buildSectionTile(mediaQueryData, context, "Steps"),
            buildSectionDetails(
              mediaQueryData,
              ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('${index + 1}# '),
                        ),
                        title: Text(
                          '${meal.steps[index]}',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                      const Divider(color: Colors.black87),
                    ],
                  );
                },
                itemCount: meal.ingredients.length,
              ),
            ),
            SizedBox(
              height: mediaQueryData.size.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
