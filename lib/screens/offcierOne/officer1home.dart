import 'package:agronomix/officertwo/feedback_view.dart';
import 'package:agronomix/screens/offcierOne/crop_monitoring_diagnosticofficer.dart';
import 'package:agronomix/screens/offcierOne/pest_identification_diagnosticofficer.dart';
import 'package:agronomix/screens/offcierOne/see_users_diagnosticofficer.dart';
import 'package:agronomix/screens/offcierOne/weather_diagnosticofficer.dart';
import 'package:flutter/material.dart';

import '../../services/auth_service.dart';



class OfficerOneHomePage extends StatefulWidget {
  const OfficerOneHomePage({super.key});

  @override
  State<OfficerOneHomePage> createState() => _OfficerOneHomePageState();
}

class _OfficerOneHomePageState extends State<OfficerOneHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade100,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen.shade900,
        title: Text("Officer One Home"),
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
                Navigator.push(context,MaterialPageRoute(builder: (context)=>CropMonitoringDiagnostic()));// Navigate to crop monitoring page
              },
            ),
            SizedBox(height: 20.0),
            _buildCard(
              icon: Icons.cloud,
              title: 'Weather Updates',
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=>DiagnosticWeather()));// Navigate to weather updates page
              },
            ),

            SizedBox(height: 20.0),
            _buildCard(
              icon: Icons.supervised_user_circle,
              title: 'See Users',
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=>SeeUsersDiagnostic()));// Navigate to weather updates page
              },
            ),
            SizedBox(height: 20.0),
            _buildCard(
              icon: Icons.pest_control,
              title: 'Pest Identification',
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=>PestIdentificationPage()));// Navigate to market prices page
              },
            ),
            // Add more cards for additional functionalities
          ],
        ),
      ),
    );
  }

  Widget _buildCard({required IconData icon, required String title, required VoidCallback onTap}) {
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

