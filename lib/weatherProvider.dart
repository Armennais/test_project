import 'package:flutter/material.dart';
import 'package:test_project/weather_data.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherData _weatherData = WeatherData(
    city: '',
    description: '',
    temperature: 0.0,
  );

  WeatherData get weatherData => _weatherData;

  void setWeatherData(WeatherData data) {
    _weatherData = data;
    notifyListeners();
  }
}
