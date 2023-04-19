import 'package:edu_weather_app/view_models/weather.dart';
import 'package:edu_weather_app/widgets/weather_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

void main() {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: WidgetsBinding.instance);
  runApp(const Application());


  // FlutterNativeSplash.remove();

}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ChangeNotifierProvider(
      create: (context) => WeatherViewModel(),
      child: const WeatherInfo(),
    ));
  }
}
