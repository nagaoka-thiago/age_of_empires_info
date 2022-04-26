import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/my_drawer.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Age of Empires 2\'s Information')),
        drawer: const MyDrawerWidget(),
        body: Center(
            child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                  'This app uses an API developed by Albert Alises Sorribas. It has information about every civilization, unit, structure and technology from Age of Empires 2 and its documentation is hosted on the link bellow.',
                  textAlign: TextAlign.justify),
              ElevatedButton(
                  onPressed: () async {
                    await launchUrl(Uri.https(
                        'age-of-empires-2-api.herokuapp.com', 'docs'));
                  },
                  child: const Text(
                      'https://age-of-empires-2-api.herokuapp.com/docs/'))
            ],
          ),
        )));
  }
}
