

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() =>
      _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String weatherData = '';

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    final apiKey = 'YOUR_API_KEY';
    final url = 'API_ENDPOINT';
    final response = await http.get(Uri.parse(url + '?apiKey=$apiKey'));

    if (response.statusCode == 200) {
      setState(() {
        weatherData = jsonDecode(response.body)['weatherData'];
      });
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Identification'),
      ),
      body: Center(
        child: weatherData.isNotEmpty
            ? Text(weatherData)
            : CircularProgressIndicator(),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: WeatherPage(),
  ));
}
