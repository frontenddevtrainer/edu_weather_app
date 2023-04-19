import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/weather.dart';

class WeatherViewModel extends ChangeNotifier {
  late final Weather _weather;

  Future<void> fetch(String city) async {
    final Dio dio = Dio();
    try {
      final response = await dio.get(
          'https://api.openweathermap.org/data/3.0/onecall?city=$city&appid={API key}');

      if (response.statusCode == 200) {
        final data = response.data;

        _weather = Weather(
            condtion: WeatherCondtion(
                description: "desc", icon: "433", title: "dass"),
            temperature: Temperature(current: 32.33, max: 34.33, min: 22.2));
      } else {}

      notifyListeners();
    } catch (e) {}
  }

  Weather get weather => _weather;
}
