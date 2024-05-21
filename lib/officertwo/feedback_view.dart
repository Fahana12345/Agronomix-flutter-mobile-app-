import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FeedbackView extends StatefulWidget {
  const FeedbackView({super.key});

  @override
  State<FeedbackView> createState() => _FeedbackViewState();
}

class _FeedbackViewState extends State<FeedbackView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen.shade900,
        title: Text("Feedbacks"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('feedbacks').orderBy('timestamp', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No feedbacks found.'));
          }

          var feedbackDocs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: feedbackDocs.length,
            itemBuilder: (context, index) {
              var feedbackData = feedbackDocs[index].data() as Map<String, dynamic>;
              var feedback = feedbackData['feedback'] ?? 'Unknown feedback';
              var username = feedbackData['username'] ?? 'anonymous';
              var timestamp = feedbackData['timestamp']?.toDate() ?? DateTime.now();

              return ListTile(
                title: Text(feedback),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('By: $username'),
                    Text('Date: ${DateFormat('yyyy-MM-dd – kk:mm').format(timestamp)}'),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
