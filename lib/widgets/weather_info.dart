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
    return Scaffold(
      appBar: AppBar(title: const Text("Weather")),
      body: Consumer<WeatherViewModel>(
        builder: (context, value, child) {
          return Padding(
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
                        print(value);
                      }
                    },
                  ),
                  Text("Current"),
                  Text("Loading...")
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
