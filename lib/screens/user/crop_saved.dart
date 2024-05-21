import 'package:agronomix/screens/user/crop_details.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:agronomix/screens/user/schedule1.dart'; // Import your ScheduleTask page

class CropSaved extends StatelessWidget {
  const CropSaved({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen.shade900,
        title: Text("Crops Saved"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('crops').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No crops found.'));
          }
          return ListView(
            children: snapshot.data!.docs.map((doc) {
              Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
              return InkWell(
                onTap: () {
                  _navigateToCropDetailPage(context, doc.id);
                },
                child: ListTile(
                  title: Text(data['name'] ?? 'Unknown Crop'),
                  subtitle: Text(data['type'] ?? 'Unknown Type'),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  void _navigateToCropDetailPage(BuildContext context, String documentId) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CropDetailPage(documentId: documentId)),
    );
  }
}

