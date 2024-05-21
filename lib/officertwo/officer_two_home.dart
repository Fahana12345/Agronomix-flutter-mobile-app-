import 'package:agronomix/officertwo/pest_Identification_agriofficer.dart';
import 'package:agronomix/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:agronomix/officerthree/pest_identification_cheifofficer.dart';
import 'package:agronomix/officertwo/crop_monitoring_agricultureofficer.dart';
import 'package:agronomix/officertwo/feedback_view.dart';
import 'package:agronomix/officertwo/see_users_agriofficer.dart';
import 'package:agronomix/officertwo/weather_agricultureofficer.dart';

class OfficerTwoHomePage extends StatefulWidget {
  const OfficerTwoHomePage({super.key});

  @override
  State<OfficerTwoHomePage> createState() => _OfficerTwoHomePageState();
}

class _OfficerTwoHomePageState extends State<OfficerTwoHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade100,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen.shade900,
        title: Text("Agriculture Officer Home"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeedbackView()),
              );
            },
            icon: Icon(Icons.feed),
          ),
          IconButton(
            onPressed: () async {
              // Assuming AuthService handles logout
              AuthService().logout().then((value) =>
                  Navigator.pushNamedAndRemoveUntil(
                      context, 'login', (route) => false));
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildCard(
              icon: Icons.eco,
              title: 'Crop Monitoring',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AgricultureCropMonitoring()),
                );
              },
            ),
            SizedBox(height: 20.0),
            _buildCard(
              icon: Icons.cloud,
              title: 'Weather Updates',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WeatherAgriculture()),
                );
              },
            ),
            SizedBox(height: 20.0),
            _buildCard(
              icon: Icons.supervised_user_circle,
              title: 'See Users',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AricultureUsers()),
                );
              },
            ),
            SizedBox(height: 20.0),
            _buildCard(
              icon: Icons.pest_control,
              title: 'Pest Identification',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PestIdentification()),
                );
              },
            ),
            // Add more cards for additional functionalities
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
      {required IconData icon,
        required String title,
        required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3.0,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 50.0,
                color: Colors.lightGreen.shade900,
              ),
              SizedBox(height: 10.0),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
