import 'package:flutter/material.dart';

void main() => runApp(About2());

class About2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'About Agriculture Officer',
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
        title: Text('About '),
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
                  'Agriculture Officer',
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
                'An Agriculture Officer plays a pivotal role in the agricultural sector, providing essential support and expertise to farmers and agricultural stakeholders. Their responsibilities encompass a broad range of activities aimed at promoting sustainable farming practices, improving crop yields, and ensuring the overall health of agricultural ecosystems. Here’s an overview of their role:',
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