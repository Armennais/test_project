class WeatherData {
  final String city;
  final String icon;
  final double temperature;
  final String? country;
  WeatherData(
      {required this.city,
      required this.icon,
      required this.temperature,
      this.country});
}
