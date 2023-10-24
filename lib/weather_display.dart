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
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (weatherData.country != null)
              Text(
                weatherData.country!,
                style: const TextStyle(fontSize: 20, color: Colors.blueAccent),
              ),
            Text('${weatherData.temperature.toStringAsFixed(2)}°C',
                style: const TextStyle(color: Colors.red, fontSize: 30)),
            if (weatherData.icon != '')
              Image.network('https:${weatherData.icon}')
          ],
        ),
      ],
    );
  }
}
