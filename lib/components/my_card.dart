import 'package:age_of_empires_info/classes/civilization.dart';
import 'package:age_of_empires_info/functions/civilization.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  final Civilization civilization;
  final String civilizationImgSrc;
  final Function() onTap;
  const CardWidget(
      {Key? key,
      required this.civilization,
      required this.onTap,
      required this.civilizationImgSrc})
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
          margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                  image: NetworkImage(widget.civilizationImgSrc),
                  width: 10,
                  height: 10),
              const SizedBox(width: 5),
              Text(
                widget.civilization.name!,
                style: const TextStyle(fontSize: 12),
              )
            ],
          )),
    );
  }
}
