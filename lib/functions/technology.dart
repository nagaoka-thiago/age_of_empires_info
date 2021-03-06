import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

Future<Map<String, dynamic>> getTechnology(String url) async {
  final response = await Dio().get(url);

  return response.data;
}

Future<String> getTechImageAgeI(String techName) async {
  final response = await http
      .get(Uri.parse('https://ageofempires.fandom.com/wiki/' + techName));

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

Future<String> getTechImageAgeII(String techName) async {
  final response = await http.get(Uri.parse(
      'https://ageofempires.fandom.com/wiki/' + techName + '_(technology)'));

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
