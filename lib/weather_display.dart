import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/weatherProvider.dart';

class WeatherDisplay extends StatefulWidget {
  const WeatherDisplay({super.key});

  @override
  State<WeatherDisplay> createState() => _WeatherDisplayState();
}

class _WeatherDisplayState extends State<WeatherDisplay> {
  @override
  Widget build(BuildContext context) {
    final weatherData = Provider.of<WeatherProvider>(context).weatherData;

    return Column(
      children: <Widget>[
        const SizedBox(
          height: 40,
        ),
        Text(
          weatherData.city,
          style: const TextStyle(
              fontSize: 50, fontWeight: FontWeight.w800, color: Colors.green),
        ),
        RichText(
          text: TextSpan(
            style: const TextStyle(color: Colors.blueAccent, fontSize: 18),
            children: [
              const TextSpan(
                text: 'Temperature:  ',
              ),
              TextSpan(
                  text: '${weatherData.temperature.toStringAsFixed(2)}°C',
                  style: const TextStyle(color: Colors.red, fontSize: 30)),
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          weatherData.description,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
