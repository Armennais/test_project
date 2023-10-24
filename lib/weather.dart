import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/city_input.dart';
import 'package:test_project/weatherProvider.dart';
import 'package:test_project/weather_data.dart';
import 'package:test_project/weather_display.dart';
import 'package:http/http.dart' as http;

class CurrentWeatherCard extends StatelessWidget {
  const CurrentWeatherCard({super.key});
  Future<void> fetchWeatherData(String city, WeatherProvider provider) async {
    const apiKey = 'RNW295TS8C2ZX7T4ER94394LJ';
    final response = await http.get(
      Uri.parse(
          'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/$city?unitGroup=metric&key=$apiKey&contentType=json'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final weatherData = WeatherData(
        city: data['address'],
        description: data['description'],
        temperature: data['days'][0]['temp'],
      );

      provider.setWeatherData(weatherData);
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  @override
  Widget build(BuildContext context) {
    final weatherProvider =
        Provider.of<WeatherProvider>(context, listen: false);
    fetchWeatherData("Saratov", weatherProvider);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          WeatherDisplay(),
          CityInput(),
        ],
      ),
    );
  }
}
