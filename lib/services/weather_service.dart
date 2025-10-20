import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherService {
  // API key loaded from .env file for security
  // Get your free API key from: https://openweathermap.org/api
  static String get _apiKey => dotenv.env['OPENWEATHER_API_KEY'] ?? '';
  static const String _baseUrl =
      'https://api.openweathermap.org/data/2.5/weather';

  Future<Map<String, dynamic>> getWeatherByCoordinates(
    double latitude,
    double longitude,
  ) async {
    try {
      final url = Uri.parse(
        '$_baseUrl?lat=$latitude&lon=$longitude&appid=$_apiKey&units=metric',
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        return {
          'temperature': data['main']['temp'].toDouble(),
          'condition': data['weather'][0]['main'],
          'description': data['weather'][0]['description'],
          'humidity': data['main']['humidity'],
          'windSpeed': data['wind']['speed'],
          'cityName': data['name'],
        };
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      print('Error fetching weather: $e');
      // Return default values in case of error
      return {
        'temperature': 20.0,
        'condition': 'Clear',
        'description': 'Clear sky',
        'humidity': 50,
        'windSpeed': 5.0,
        'cityName': 'Unknown',
      };
    }
  }

  Future<Map<String, dynamic>> getWeatherByCityName(String cityName) async {
    try {
      final url = Uri.parse(
        '$_baseUrl?q=$cityName&appid=$_apiKey&units=metric',
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        return {
          'temperature': data['main']['temp'].toDouble(),
          'condition': data['weather'][0]['main'],
          'description': data['weather'][0]['description'],
          'humidity': data['main']['humidity'],
          'windSpeed': data['wind']['speed'],
          'cityName': data['name'],
        };
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      print('Error fetching weather: $e');
      // Return default values in case of error
      return {
        'temperature': 20.0,
        'condition': 'Clear',
        'description': 'Clear sky',
        'humidity': 50,
        'windSpeed': 5.0,
        'cityName': cityName,
      };
    }
  }
}
