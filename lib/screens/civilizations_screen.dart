import 'package:age_of_empires_info/components/my_card.dart';
import 'package:age_of_empires_info/functions/civilization.dart';
import 'package:age_of_empires_info/screens/civilization_screen.dart';
import 'package:flutter/material.dart';

import '../classes/civilization.dart';
import '../components/my_drawer.dart';

class CivilizationsScreenWidget extends StatelessWidget {
  const CivilizationsScreenWidget({Key? key}) : super(key: key);

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
                return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                    itemCount: civilizations.length,
                    itemBuilder: (context, i) {
                      Civilization civilization = civilizations[i];
                      return CardWidget(
                          civilization: civilization,
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return CivilizationScreenWidget(
                                  civilization: civilization);
                            }));
                          });
                    });
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }
}
