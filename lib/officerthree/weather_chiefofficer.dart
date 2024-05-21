import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherCheif extends StatefulWidget {
  const WeatherCheif({super.key});

  @override
  State<WeatherCheif> createState() => _WeatherCheifState();
}

class _WeatherCheifState extends State<WeatherCheif> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen.shade900,
        title: Text("Weather Updates"),
      ),
    );
  }
}
