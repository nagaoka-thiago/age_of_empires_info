import 'package:age_of_empires_info/functions/civilization.dart';
import 'package:flutter/material.dart';

import '../classes/civilization.dart';
import '../components/my_drawer.dart';

class CivilizationScreenWidget extends StatelessWidget {
  const CivilizationScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Civilizations')),
        drawer: const MyDrawerWidget(),
        body: FutureBuilder(
            future: getCivilizations(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                final civilizations = snapshot.data['civilizations']
                    .map((civilization) => Civilization.fromJson(
                        civilization as Map<String, dynamic>))
                    .toList();
                return ListView.builder(
                    itemCount: civilizations.length,
                    itemBuilder: (context, i) {
                      Civilization civilization = civilizations[i];
                      return Text(civilization.name!);
                    });
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}
