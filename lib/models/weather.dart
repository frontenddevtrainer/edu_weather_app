class Temperature {
  final double current;
  final double max;
  final double min;

  Temperature({required this.current, required this.max, required this.min});
}

class WeatherCondtion {
  final String title;
  final String description;
  final String icon;

  WeatherCondtion(
      {required this.title, required this.description, required this.icon});
}

class Weather {
  final WeatherCondtion condtion;
  final Temperature temperature;

  Weather({required this.condtion, required this.temperature});
}
