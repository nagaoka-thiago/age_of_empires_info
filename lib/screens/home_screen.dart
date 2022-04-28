import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/my_drawer.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Image(
                image: NetworkImage(
                    'https://i.ytimg.com/vi/oLJk_nIMdkc/maxresdefault.jpg'),
                width: 1200,
                height: 40)),
        drawer: const MyDrawerWidget(),
        body: Center(
            child: Container(
          width: 450,
          height: 550,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: const NetworkImage(
                      'https://cdn.ageofempires.com/aoe-forums/optimized/3X/1/3/1350085af0ac89eac8018794e0e057f9a4cf1552_2_690x388.jpeg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.4), BlendMode.dstATop))),
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                  'This app uses an API developed by Albert Alises Sorribas. It has information about every civilization, unit, structure and technology from Age of Empires 2 and its documentation is hosted in the link bellow.',
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
