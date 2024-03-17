import 'package:dio/dio.dart';
import 'dart:convert';

import '../../core/values/endpoints.dart';
import '../../models/wather.dart';


class WeatherRepository{

  final Dio _dio = Dio();

  Future<Wather> getWeather(double latitude, double longitude) async {
    final url =
        '$apiUrl?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';

    try {
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data;
        return Wather.fromJson(data);
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      throw Exception('Failed to load weather data: $e');
    }
  }
}
