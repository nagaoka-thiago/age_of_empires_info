import 'package:flutter/material.dart';

import '../classes/civilization.dart';
import '../components/my_drawer.dart';

class CivilizationScreenWidget extends StatelessWidget {
  final Civilization civilization;
  const CivilizationScreenWidget({Key? key, required this.civilization})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Civilization: ' + civilization.name!)),
        //drawer: const MyDrawerWidget(),
        body: Container(child: Text('Testando!')));
  }
}
