import 'package:dio/dio.dart';

Future<Map<String, dynamic>> getTechnology(String url) async {
  final response = await Dio().get(url);

  return response.data;
}
