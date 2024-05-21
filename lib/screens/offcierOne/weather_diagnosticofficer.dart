import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiagnosticWeather extends StatefulWidget {
  const DiagnosticWeather({super.key});

  @override
  State<DiagnosticWeather> createState() => _DiagnostivWeatherState();
}

class _DiagnostivWeatherState extends State<DiagnosticWeather> {
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
