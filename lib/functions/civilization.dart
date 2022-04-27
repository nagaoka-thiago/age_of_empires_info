import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

Future<Map<String, dynamic>> getCivilizations() async {
  final response = await Dio()
      .get('https://age-of-empires-2-api.herokuapp.com/api/v1/civilizations');

  return response.data;
}

Future<String> getCivilizationImageAgeI(String civilization_name) async {
  final response = await http.get(
      Uri.parse('https://ageofempires.fandom.com/wiki/' + civilization_name));

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

Future<String> getCivilizationImageAgeII(String civilization_name) async {
  final response = await http.get(Uri.parse(
      'https://ageofempires.fandom.com/wiki/' +
          civilization_name +
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
