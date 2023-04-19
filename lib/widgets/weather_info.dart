import 'package:edu_weather_app/models/weather.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/weather.dart';

class WeatherInfo extends StatefulWidget {
  const WeatherInfo({super.key});

  @override
  State<WeatherInfo> createState() => _WeatherInfoState();
}

class _WeatherInfoState extends State<WeatherInfo> {
  final _cityTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<WeatherViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Weather")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _cityTextController,
                decoration: InputDecoration(labelText: "Enter city"),
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    // Fetch
                    viewModel.fetch(value);
                  }
                },
              ),
              Consumer<WeatherViewModel>(builder: (context, value, child) {
                if (value.weather != null) {

                  final temperature = value.weather!.temperature.current;

                  return Column(
                    children: [
                      Text("Tempreture $temperature."),
                      Text("Tempreture $temperature."),
                      Text("Tempreture $temperature."),
                      Text("Tempreture $temperature.")
                    ],
                  );
                }
                return CircularProgressIndicator();
              })
            ],
          ),
        ),
      ),
    );
  }
}
