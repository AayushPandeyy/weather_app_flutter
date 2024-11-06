import 'package:dio/dio.dart';
import 'package:weather_app_flutter/models/WeatherData.dart';

class WeatherService {
  final String apiKey = 'YOUR_API_KEY'; // Replace with your WeatherAPI key
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> getWeather(String location) async {
    try {
      final response = await _dio.get(
        'https://api.weatherapi.com/v1/forecast.json',
        queryParameters: {
          'key': apiKey,
          'q': location,
          'days': 7,
        },
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

    Future<List<WeatherData>> get7DayForecast(String location) async {
    try {
      final response = await _dio.get(
        'https://api.weatherapi.com/v1/forecast.json',
        queryParameters: {
          'key': apiKey,
          'q': location,
          'days': 7,
        },
      );

      if (response.statusCode == 200) {
        final forecastData = response.data['forecast']['forecastday'] as List;
        return forecastData.map((day) => WeatherData.fromJson(day)).toList();
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
