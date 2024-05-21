import 'package:flutter/material.dart';

void main() => runApp(About3());

class About3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'About Cheif Agriculture Officer',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: AboutPage(),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen.shade900,
        title: Text('About'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/img/profile.jpg'), // Add your image in assets
                ),
              ),
              SizedBox(height: 20),


              Center(
                child: Text(
                  'Cheif Agriculture Officer',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Biography',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
              ),
              SizedBox(height: 10),
              Text(
                'The Chief Agriculture Officer (CAO) holds a senior executive role within the agricultural sector, tasked with overseeing and directing all agricultural activities and initiatives within an organization, government body, or region. With extensive experience and a strategic vision, the CAO plays a crucial role in shaping the future of agriculture through policy development, program management, and stakeholder engagement.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Responsibilities',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
              ),
              SizedBox(height: 10),
              Text(
                '- Conducting field visits and farm inspections\n'
                    '- Advising farmers on crop cultivation and soil management\n'
                    '- Implementing government agricultural policies\n'
                    '- Organizing training programs and workshops\n'
                    '- Promoting sustainable farming practices',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Contact Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[800],
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.email, color: Colors.green[700]),
                  SizedBox(width: 10),
                  Text(
                    'Imran.doe@example.com',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.phone, color: Colors.green[700]),
                  SizedBox(width: 10),
                  Text(
                    '+123 456 7678',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.green[700]),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      '123 Agriculture Lane, Farmville, Country',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}