import 'package:age_of_empires_info/components/my_card.dart';
import 'package:age_of_empires_info/functions/civilization.dart';
import 'package:flutter/material.dart';

import '../classes/civilization.dart';
import '../components/my_drawer.dart';

class CivilizationsScreenWidget extends StatelessWidget {
  const CivilizationsScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(children: const [
          Text('Civilizations'),
          Image(
              image: NetworkImage(
                  'https://i.ytimg.com/vi/oLJk_nIMdkc/maxresdefault.jpg'),
              width: 100,
              height: 40)
        ])),
        drawer: const MyDrawerWidget(),
        body: Container(
          width: 450,
          height: 550,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: const NetworkImage(
                      'https://cdn.ageofempires.com/aoe-forums/optimized/3X/1/3/1350085af0ac89eac8018794e0e057f9a4cf1552_2_690x388.jpeg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.4), BlendMode.dstATop))),
          child: FutureBuilder(
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
                              crossAxisCount: 3),
                      itemCount: civilizations.length,
                      itemBuilder: (context, i) {
                        Civilization civilization = civilizations[i];
                        return FutureBuilder(
                            future:
                                getCivilizationImageAgeI(civilization.name!),
                            builder: (context1, AsyncSnapshot snapshot1) {
                              if (snapshot1.hasData &&
                                  (snapshot1.data as String).isNotEmpty) {
                                return CardWidget(
                                    civilization: civilization,
                                    civilizationImgSrc: snapshot1.data,
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, 'civilization', arguments: [
                                        civilization,
                                        snapshot1.data
                                      ]);
                                    });
                              } else {
                                return FutureBuilder(
                                    future: getCivilizationImageAgeII(
                                        civilization.name!),
                                    builder:
                                        (context2, AsyncSnapshot snapshot2) {
                                      if (snapshot2.hasData &&
                                          (snapshot2.data as String)
                                              .isNotEmpty) {
                                        return CardWidget(
                                            civilization: civilization,
                                            civilizationImgSrc: snapshot2.data,
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, 'civilization',
                                                  arguments: [
                                                    civilization,
                                                    snapshot2.data
                                                  ]);
                                            });
                                      } else {
                                        return const Center(
                                            child: CircularProgressIndicator());
                                      }
                                    });
                              }
                            });
                      });
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ));
  }
}
