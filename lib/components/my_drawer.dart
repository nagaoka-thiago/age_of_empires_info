import 'package:age_of_empires_info/screens/civilizations_screen.dart';
import 'package:flutter/material.dart';

class MyDrawerWidget extends StatelessWidget {
  const MyDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        const SizedBox(
          height: 20,
          child: DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Menu', style: TextStyle(fontSize: 20))),
        ),
        ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            }),
        ListTile(
            title: const Text('Civilizations'),
            onTap: () {
              Navigator.pushNamed(context, 'civilizations');
            })
      ]),
    );
  }
}
