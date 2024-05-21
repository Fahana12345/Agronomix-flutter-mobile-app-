import 'package:agronomix/officerthree/crop_monitoring_chiefofficer.dart';
import 'package:agronomix/officerthree/see_users_cheifofficer.dart';
import 'package:agronomix/officerthree/weather_chiefofficer.dart';
import 'package:agronomix/officertwo/feedback_view.dart';
import 'package:agronomix/services/auth_service.dart';
import 'package:flutter/material.dart';

import '../screens/offcierOne/pest_identification_diagnosticofficer.dart';



class OfficerThreeHomePage extends StatefulWidget {
  const OfficerThreeHomePage({super.key});

  @override
  State<OfficerThreeHomePage> createState() => _OfficerThreeHomePageState();
}

class _OfficerThreeHomePageState extends State<OfficerThreeHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Chief Officer Home"),
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
                Navigator.push(context,MaterialPageRoute(builder: (context)=>CheifCropMonitoring()));// Navigate to crop monitoring page
              },
            ),
            SizedBox(height: 20.0),
            _buildCard(
              icon: Icons.cloud,
              title: 'Weather Updates',
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=>WeatherCheif()));// Navigate to weather updates page
              },
            ),
            SizedBox(height: 20.0),
            _buildCard(
              icon: Icons.supervised_user_circle,
              title: 'See Users',
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=>CheifUsers()));// Navigate to weather updates page
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


