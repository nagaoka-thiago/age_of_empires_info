import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

Future<Map<String, dynamic>> getUnit(String url) async {
  final response = await Dio().get(url);

  return response.data;
}

Future<String> getUnitImageAgeI(String unitName) async {
  final response = await http
      .get(Uri.parse('https://ageofempires.fandom.com/wiki/' + unitName));

  final document = parse(response.body);
  final figures = document.getElementsByClassName('pi-item pi-image');
  if (figures.isNotEmpty) {
    final figure = figures[0];
    final imgs = figure.getElementsByTagName('img');
    if (imgs.isNotEmpty) {
      final img = imgs[0];
      final imgSrc = img.attributes['src'];

      return imgSrc!;
    }
  }

  return Future.value('');
}

Future<String> getUnitImageAgeII(String unitName) async {
  final response = await http.get(Uri.parse(
      'https://ageofempires.fandom.com/wiki/' +
          unitName +
          '_(Age_of_Empires_II)'));

  final document = parse(response.body);
  final figures = document.getElementsByClassName('pi-item pi-image');
  if (figures.isNotEmpty) {
    final figure = figures[0];
    final imgs = figure.getElementsByTagName('img');
    if (imgs.isNotEmpty) {
      final img = imgs[0];
      final imgSrc = img.attributes['src'];

      return imgSrc!;
    }
  }

  return Future.value('');
}
