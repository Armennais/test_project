import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:test_project/app_config.dart';
import 'package:test_project/weatherProvider.dart';
import 'dart:convert';
import 'dart:async';
import 'package:test_project/weather_data.dart';

class CityInput extends StatefulWidget {
  const CityInput({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CityInputState createState() => _CityInputState();
}

class _CityInputState extends State<CityInput> {
  final TextEditingController _cityController = TextEditingController();
  @override
  void initState() {
    super.initState();
    fetchWeatherData(_cityController.text);
    // Timer.periodic(Duration(seconds: 3), (timer) {
    //   fetchWeatherData(
    //       _cityController.text == "" ? "Saratov" : _cityController.text);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: _cityController,
          decoration: const InputDecoration(labelText: 'Enter City Name'),
        ),
        ElevatedButton(
          onPressed: () async {
            try {
              final city = _cityController.text;
              if (city.isNotEmpty) {
                final weatherData = await fetchWeatherData(city);
                // ignore: use_build_context_synchronously
                Provider.of<WeatherProvider>(context, listen: false)
                    .setWeatherData(weatherData);
              }
            } catch (e) {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Center(
                    child: Text(e.toString()),
                  );
                },
              );
            }
          },
          child: const Text('Get Weather'),
        ),
      ],
    );
  }

  Future<WeatherData> fetchWeatherData(String city) async {
    final response = await http.get(
      Uri.parse(
          '${AppConfig.APP_WEATHER_URL}?key=${AppConfig.APP_API_KEY}&q=$city'),
    );
    print(response.body);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return WeatherData(
          city: data['location']['name'],
          icon: data['current']['condition']['icon'],
          temperature: data['current']['temp_c'],
          country: data['location']['country']);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
