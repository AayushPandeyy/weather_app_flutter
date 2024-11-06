import 'package:intl/intl.dart';

class WeatherData {
  final String date;
  final String conditionText;
  final double tempC;
  final double wind;
  final int humidity;
  final double visibility;

  WeatherData({
    required this.date,
    required this.conditionText,
    required this.tempC,
    required this.wind,
    required this.humidity,
    required this.visibility,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      date: json['date'] ?? '',
      conditionText: json['day']['condition']['text'] ?? '',
      tempC: json['day']['avgtemp_c']?.toDouble() ?? 0.0,
      wind: json['day']['maxwind_kph']?.toDouble() ?? 0.0,
      humidity: json['day']['avghumidity']?.toInt() ?? 0,
      visibility: json['day']['avgvis_km']?.toDouble() ?? 0.0,
    );
  }
}
