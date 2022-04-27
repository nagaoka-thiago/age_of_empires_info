import 'package:age_of_empires_info/classes/civilization.dart';
import 'package:age_of_empires_info/functions/civilization.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  final Civilization civilization;
  final Function() onTap;
  const CardWidget({Key? key, required this.civilization, required this.onTap})
      : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
          margin: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              FutureBuilder(
                  future: getCivilizationImageAgeI(widget.civilization.name!),
                  builder: (context1, AsyncSnapshot snapshot1) {
                    if (snapshot1.hasData &&
                        (snapshot1.data as String).isNotEmpty) {
                      return Image(
                          image: NetworkImage(snapshot1.data),
                          width: 20,
                          height: 20);
                    } else {
                      return FutureBuilder(
                          future: getCivilizationImageAgeII(
                              widget.civilization.name!),
                          builder: (context2, AsyncSnapshot snapshot2) {
                            if (snapshot2.hasData &&
                                (snapshot2.data as String).isNotEmpty) {
                              return Image(
                                  image: NetworkImage(snapshot2.data),
                                  width: 20,
                                  height: 20);
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          });
                    }
                  }),
              const SizedBox(width: 5),
              Flexible(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.civilization.name!,
                        style: const TextStyle(fontSize: 12),
                      ),
                      Text(widget.civilization.armyType!,
                          style: const TextStyle(fontSize: 12))
                    ]),
              )
            ],
          )),
    );
  }
}
