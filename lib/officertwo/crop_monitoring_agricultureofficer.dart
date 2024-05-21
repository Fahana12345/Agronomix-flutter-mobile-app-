import 'package:flutter/material.dart';

void main() {
  runApp(AgricultureCropMonitoring());
}

class Crop {
  final String name;
  final String image;
  final String description;

  Crop({
    required this.name,
    required this.image,
    required this.description,
  });
}

class AgricultureCropMonitoring extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crop Monitoring',
      theme: ThemeData(

        primarySwatch: Colors.green,
      ),
      home: CropMonitoringScreen(),
    );
  }
}

class CropMonitoringScreen extends StatelessWidget {
  final List<Crop> crops = [
    Crop(
      name: 'Tomato',
      image: 'assets/img/tomato.jpg',
      description:
      'Tomato is a red, edible fruit that is typically eaten as a vegetable.',
    ),
    Crop(
      name: 'Corn',
      image: 'assets/img/corn.jpg',
      description:
      'Corn is a cereal plant that produces large grains, or kernels, set in rows on a cob.',
    ),
    Crop(
      name: 'Lettuce',
      image: 'assets/img/lettuce.jpg',
      description:
      'Lettuce is a leafy vegetable often used in salads and sandwiches.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade100,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen.shade900,
        title: Text('Crop Monitoring'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 0.8,
        ),
        itemCount: crops.length,
        itemBuilder: (context, index) {
          return CropCard(
            crop: crops[index],
          );
        },
      ),
    );
  }
}

class CropCard extends StatelessWidget {
  final Crop crop;

  const CropCard({
    required this.crop,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
              child: Image.asset(
                crop.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  crop.name,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  crop.description,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 7.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CropDetailScreen(crop: crop),
                      ),
                    );
                  },
                  child: Text('View Details'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CropDetailScreen extends StatelessWidget {
  final Crop crop;

  const CropDetailScreen({
    required this.crop,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.lightGreen.shade900,
        title: Text(crop.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              crop.image,
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),
            Text(
              crop.name,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              crop.description,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Monitoring Data',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.date_range),
                    title: Text('Last Watered: 2023-05-01'),
                  ),
                  ListTile(
                    leading: Icon(Icons.assistant_photo),
                    title: Text('Humidity: 50%'),
                  ),
                  ListTile(
                    leading: Icon(Icons.wb_sunny),
                    title: Text('Light: Full Sun'),
                  ),
                  ListTile(
                    leading: Icon(Icons.waves),
                    title: Text('Water Level: Adequate'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}