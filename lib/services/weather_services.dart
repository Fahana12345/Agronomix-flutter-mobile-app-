import 'dart:convert';
import 'package:agronomix/models/weather_model.dart';
import 'package:http/http.dart' as http;
// import 'weather.dart';

class WeatherService {
  final String apiKey = 'YOUR_API_KEY'; // Replace with your OpenWeatherMap API key
  final String apiUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<Weather> fetchWeather(String city) async {
    final response = await http.get(Uri.parse('$apiUrl?q=$city&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
