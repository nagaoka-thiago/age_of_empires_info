import 'package:age_of_empires_info/screens/civilization_screen.dart';
import 'package:age_of_empires_info/screens/civilizations_screen.dart';
import 'package:age_of_empires_info/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'classes/civilization.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Age of Empires\'s Information',
      initialRoute: '/',
      home: const HomeScreenWidget(),
      onGenerateRoute: (routeSettings) {
        if (routeSettings.name == 'civilizations') {
          return MaterialPageRoute(
              builder: (context) => const CivilizationsScreenWidget());
        } else if (routeSettings.name == 'civilization') {
          final List args = (routeSettings.arguments as List);
          final Civilization civilization = args[0] as Civilization;
          final String civilizationImgSrc = args[1] as String;
          return MaterialPageRoute(
              builder: (context) => CivilizationScreenWidget(
                  civilization: civilization,
                  civilizationImgSrc: civilizationImgSrc));
        }
        return null;
      },
    );
  }
}
