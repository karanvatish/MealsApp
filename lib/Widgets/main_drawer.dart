import 'package:flutter/material.dart';
import 'package:meals_app/Screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget buildListTile(String title, IconData icon, Function selectHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () => selectHandler(),
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Drawer(
      elevation: 5,
      child: Column(
        children: [
          Container(
            height: mediaQueryData.size.height * .13,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: mediaQueryData.size.height * .05,
          ),
          buildListTile('Meals', Icons.restaurant,
              () => Navigator.of(context).pushNamed('/')),
          buildListTile('Filters', Icons.settings,
              () => Navigator.of(context).pushNamed(FiltersScreen.routeName)),
        ],
      ),
    );
  }
}
