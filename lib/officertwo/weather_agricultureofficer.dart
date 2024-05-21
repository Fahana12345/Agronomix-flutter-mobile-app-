import 'package:agronomix/models/weather_model.dart';
import 'package:agronomix/services/weather_services.dart';
import 'package:flutter/material.dart';
// import 'weather_service.dart';
// import 'weather.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherAgriculture extends StatefulWidget {
  @override
  _WeatherAgricultureState createState() => _WeatherAgricultureState();
}

class _WeatherAgricultureState extends State<WeatherAgriculture> {
  final WeatherService _weatherService = WeatherService();
  late Future<Weather> _weather;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _weather = _weatherService.fetchWeather('London'); // Default city
  }

  void _searchWeather() {
    setState(() {
      _weather = _weatherService.fetchWeather(_controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Identification'),
        backgroundColor: Colors.lightGreen.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter city name',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _searchWeather,
                ),
              ),
            ),
            SizedBox(height: 20),
            FutureBuilder<Weather>(
              future: _weather,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData) {
                  return Text('No data found');
                } else {
                  final weather = snapshot.data!;
                  return Column(
                    children: [
                      Text(
                        weather.description,
                        style: TextStyle(fontSize: 24),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BoxedIcon(
                            WeatherIcons.fromString(weather.icon),
                            size: 50,
                          ),
                          SizedBox(width: 20),
                          Text(
                            '${weather.temperature}°C',
                            style: TextStyle(fontSize: 50),
                          ),
                        ],
                      ),
                      Text(
                        'Humidity: ${weather.humidity}%',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
