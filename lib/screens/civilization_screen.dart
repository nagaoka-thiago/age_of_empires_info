import 'package:age_of_empires_info/classes/technology.dart';
import 'package:age_of_empires_info/functions/unit.dart';
import 'package:flutter/material.dart';

import '../classes/civilization.dart';
import '../classes/unit.dart';
import '../functions/technology.dart';

class CivilizationScreenWidget extends StatelessWidget {
  final Civilization civilization;
  final String civilizationImgSrc;
  const CivilizationScreenWidget(
      {Key? key, required this.civilization, required this.civilizationImgSrc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: Row(children: [
            Text('Civilization: ' + civilization.name!),
            const SizedBox(width: 5),
            Image(
                image: NetworkImage(civilizationImgSrc), width: 40, height: 40)
          ]),
        ),
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
          child: Column(children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Text('Expansion: ' + civilization.expansion!,
                  style: const TextStyle(fontSize: 18)),
            ),
            Container(
                margin: const EdgeInsets.only(top: 10),
                child: Text('Army type: ' + civilization.armyType!,
                    style: const TextStyle(fontSize: 18))),
            civilization.uniqueTech != null &&
                    civilization.uniqueTech!.isNotEmpty
                ? Container(
                    height: 120,
                    margin: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Unique Tech ',
                            style: TextStyle(fontSize: 18)),
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: civilization.uniqueTech!.length,
                                  itemBuilder: (context, i) {
                                    return FutureBuilder(
                                        future: getTechnology(
                                            civilization.uniqueTech![i]),
                                        builder:
                                            (context, AsyncSnapshot snapshot) {
                                          if (!snapshot.hasData) {
                                            return const Text('');
                                          }
                                          final Technology tech =
                                              Technology.fromJson(
                                                  snapshot.data);
                                          return Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 8),
                                            child: Row(
                                              children: [
                                                FutureBuilder(
                                                    future: getTechImageAgeI(
                                                        tech.name!),
                                                    builder: (context1,
                                                        AsyncSnapshot
                                                            snapshot1) {
                                                      if (!snapshot1.hasData) {
                                                        return const Text('');
                                                      } else if ((snapshot1.data
                                                              as String)
                                                          .isEmpty) {
                                                        return FutureBuilder(
                                                            future:
                                                                getTechImageAgeII(
                                                                    tech.name!),
                                                            builder: (context2,
                                                                AsyncSnapshot
                                                                    snapshot2) {
                                                              if (!snapshot2
                                                                  .hasData) {
                                                                return const Text(
                                                                    '');
                                                              } else if ((snapshot2
                                                                          .data
                                                                      as String)
                                                                  .isEmpty) {
                                                                return const Text(
                                                                    '');
                                                              }
                                                              return Image(
                                                                  image: NetworkImage(
                                                                      snapshot2
                                                                              .data
                                                                          as String),
                                                                  width: 40,
                                                                  height: 40);
                                                            });
                                                      }
                                                      return Image(
                                                          image: NetworkImage(
                                                              snapshot1.data
                                                                  as String),
                                                          width: 40,
                                                          height: 40);
                                                    }),
                                                Column(children: [
                                                  Text(
                                                    'Name: ' +
                                                        tech.name! +
                                                        (tech.cost != null
                                                            ? ' (' +
                                                                (tech.cost!.gold !=
                                                                        null
                                                                    ? 'gold: ' +
                                                                        tech.cost!
                                                                            .gold
                                                                            .toString() +
                                                                        (tech.cost!.food !=
                                                                                null
                                                                            ? ', food: ' +
                                                                                tech.cost!.food
                                                                                    .toString() +
                                                                                ')'
                                                                            : ')')
                                                                    : (tech.cost!.food !=
                                                                            null
                                                                        ? 'food: ' +
                                                                            tech.cost!.food.toString()
                                                                        : ')'))
                                                            : ''),
                                                    style: const TextStyle(
                                                        fontSize: 11),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  Text(
                                                      'Build time: ' +
                                                          tech.buildTime
                                                              .toString() +
                                                          's',
                                                      style: const TextStyle(
                                                          fontSize: 11)),
                                                  Text(tech.age! + ' age',
                                                      style: const TextStyle(
                                                          fontSize: 11))
                                                ]),
                                              ],
                                            ),
                                          );
                                        });
                                  }),
                            ],
                          ),
                        )
                      ],
                    ))
                : const Text(''),
            civilization.uniqueUnit != null &&
                    civilization.uniqueUnit!.isNotEmpty
                ? Center(
                    child: Container(
                        height: 120,
                        margin: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('Unique Unit ',
                                style: TextStyle(fontSize: 18)),
                            Flexible(
                                child: ListView.builder(
                                    itemCount: civilization.uniqueUnit!.length,
                                    itemBuilder: (context, i) {
                                      return FutureBuilder(
                                          future: getUnit(
                                              civilization.uniqueUnit![i]),
                                          builder: (context,
                                              AsyncSnapshot snapshot) {
                                            if (!snapshot.hasData) {
                                              return const Text('');
                                            }
                                            final Unit unit =
                                                Unit.fromJson(snapshot.data);
                                            return Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 8),
                                              child: Row(
                                                children: [
                                                  FutureBuilder(
                                                      future: getUnitImageAgeI(
                                                          unit.name!),
                                                      builder: (context1,
                                                          AsyncSnapshot
                                                              snapshot1) {
                                                        if (!snapshot1
                                                            .hasData) {
                                                          return const Text('');
                                                        } else if ((snapshot1
                                                                .data as String)
                                                            .isEmpty) {
                                                          return FutureBuilder(
                                                              future:
                                                                  getUnitImageAgeII(
                                                                      unit
                                                                          .name!),
                                                              builder: (context2,
                                                                  AsyncSnapshot
                                                                      snapshot2) {
                                                                if (!snapshot2
                                                                    .hasData) {
                                                                  return const Text(
                                                                      '');
                                                                } else if ((snapshot2
                                                                            .data
                                                                        as String)
                                                                    .isEmpty) {
                                                                  return const Text(
                                                                      '');
                                                                }
                                                                return Image(
                                                                    image: NetworkImage(
                                                                        snapshot2.data
                                                                            as String),
                                                                    width: 40,
                                                                    height: 40);
                                                              });
                                                        }
                                                        return Image(
                                                            image: NetworkImage(
                                                                snapshot1.data
                                                                    as String),
                                                            width: 40,
                                                            height: 40);
                                                      }),
                                                  Column(children: [
                                                    Text('Name: ' + unit.name!,
                                                        style: const TextStyle(
                                                            fontSize: 11)),
                                                    unit.attack != null
                                                        ? Text(
                                                            'Atack: ' +
                                                                unit.attack
                                                                    .toString(),
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        11))
                                                        : const Text(''),
                                                    unit.buildTime != null
                                                        ? Text(
                                                            'Build time: ' +
                                                                unit.buildTime
                                                                    .toString() +
                                                                's',
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        11))
                                                        : const Text('')
                                                  ]),
                                                ],
                                              ),
                                            );
                                          });
                                    }))
                          ],
                        )),
                  )
                : const Text(''),
            Container(
                margin: const EdgeInsets.only(top: 10),
                child: Text(
                  civilization.teamBonus != null
                      ? 'Team Bonus: ' + civilization.teamBonus!
                      : '',
                  style: const TextStyle(fontSize: 18),
                ))
          ]),
        ));
  }
}
