import 'package:agronomix/screens/user/schedule1.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CropDetailPage extends StatelessWidget {
  final String documentId;

  const CropDetailPage({Key? key, required this.documentId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade100,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen.shade900,
        title: Text('Crop Detail'),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance.collection('crops').doc(documentId).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('Crop not found.'));
          }
          var data = snapshot.data!.data() as Map<String, dynamic>;
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Crop Name: ${data['name'] ?? 'Unknown'}'),
                  SizedBox(height: 10),
                  Text('Crop Type: ${data['type'] ?? 'Unknown'}'),
                  SizedBox(height: 10),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        _navigateToScheduleTask(context);
                      },
                      child: Text(
                        'Go to Schedule Task',
                        style: TextStyle(color: Colors.lightGreen.shade900),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _navigateToScheduleTask(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ScheduleTask()),
    );
  }
}
