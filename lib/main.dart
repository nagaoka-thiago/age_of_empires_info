import 'package:age_of_empires_info/components/my_drawer.dart';
import 'package:age_of_empires_info/screens/civilizations_screen.dart';
import 'package:age_of_empires_info/screens/home_screen.dart';
import 'package:age_of_empires_info/screens/units_screen.dart';
import 'package:flutter/material.dart';

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
        routes: {
          '/civilizations': (context) => const CivilizationScreenWidget(),
          '/units': (context) => const UnitsScreenWidget()
        });
  }
}
