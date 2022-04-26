import 'package:flutter/material.dart';

import '../components/my_drawer.dart';

class UnitsScreenWidget extends StatelessWidget {
  const UnitsScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Units')),
        drawer: const MyDrawerWidget(),
        body: Container(child: Text('Units Screen Test')));
  }
}
