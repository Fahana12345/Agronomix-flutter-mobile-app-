import 'package:flutter/material.dart';

void main() => runApp(About1());

class About1 extends StatelessWidget {
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

              SizedBox(height: 10),
              Center(
                child: Text(
                  ' Diagnostic lab Officer',
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
                'Diagnostic Lab Officer is a dedicated Diagnostic Agriculture Lab Officer with over a decade of experience in agricultural science. Specializing in soil analysis and crop health diagnostics, John plays a crucial role in supporting sustainable farming practices. His expertise in identifying plant diseases and nutrient deficiencies helps farmers enhance yield and productivity. Known for his meticulous approach and commitment to advancing agricultural research, John Sha is a vital asset to the farming community, contributing to the development of innovative solutions for modern agricultural challenges.',
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
                '- Advisory Services: Offer expert advice and consultation to farmers on soil management, fertilization strategies, pest control, and disease prevention based on lab findings.\n'
                    '- Quality Control: Ensure the accuracy and reliability of laboratory tests by maintaining strict quality control procedures and calibration of lab equipment.\n'
                    '- Reporting: Prepare detailed reports on diagnostic findings, including recommendations for corrective actions, and communicate these reports to stakeholders.\n'
                    '- Training and Education: Conduct training sessions and workshops for farmers and agricultural workers on best practices in soil health management and disease prevention.\n'
                    '-Compliance and Safety: Adhere to all safety protocols and regulatory requirements in the laboratory, ensuring a safe working environment and compliance with environmental standards. ',
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
                    'john.doe@example.com',
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
                    '+123 456 7890',
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