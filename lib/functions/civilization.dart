import 'package:age_of_empires_info/classes/civilization.dart';
import 'package:dio/dio.dart';

Future<Map<String, dynamic>> getCivilizations() async {
  final response = await Dio()
      .get('https://age-of-empires-2-api.herokuapp.com/api/v1/civilizations');

  return response.data;
}
