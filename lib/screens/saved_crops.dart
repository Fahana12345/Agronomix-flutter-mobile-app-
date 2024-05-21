import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SavedCrops extends StatelessWidget {
  const SavedCrops({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saved Crops"),
        backgroundColor: Colors.lightGreen.shade900,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('plants').orderBy('timestamp').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No plants saved yet.'));
          }

          return ListView(
            children: snapshot.data!.docs.map((doc) {
              var plant = doc.data() as Map<String, dynamic>;
              return ListTile(
                title: Text(plant['name']),
                subtitle: Text(plant['type']),
                trailing: Text((plant['timestamp'] as Timestamp).toDate().toString()),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
