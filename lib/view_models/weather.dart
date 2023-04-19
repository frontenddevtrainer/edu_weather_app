import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/weather.dart';

class WeatherViewModel extends ChangeNotifier {
   Weather? _weather;

  Future<void> fetch(String city) async {
    final Dio dio = Dio();
    try {
      final response = await dio.get(
          'http://api.weatherstack.com/current?access_key=837b3dc715e43632022591e954a342b4&query=$city');

      if (response.statusCode == 200) {
        final data = response.data;
        final current = data["current"];
        _weather = Weather(
            condtion: WeatherCondtion(
                description: current["weather_descriptions"][0],
                icon: current["weather_icons"][0],
                title: current["weather_descriptions"][0]),
            temperature: Temperature(
                current: current['temperature'].toDouble(), max: 34.33, min: 22.2));
      } else {}

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Weather? get weather => _weather;
}
