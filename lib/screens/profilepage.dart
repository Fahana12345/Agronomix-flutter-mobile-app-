import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void _showFeedbackDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Feedback'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('How do you feel about our app?'),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Handle happy feedback
                      _submitFeedback('Happy');
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Thank you for your positive feedback!')),
                      );
                    },
                    child: Column(
                      children: [
                        Text(
                          '😀',
                          style: TextStyle(fontSize: 40),
                        ),
                        Text('Happy'),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle neutral feedback
                      _submitFeedback('Neutral');
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Thank you for your feedback!')),
                      );
                    },
                    child: Column(
                      children: [
                        Text(
                          '😐',
                          style: TextStyle(fontSize: 40),
                        ),
                        Text('Neutral'),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle sad feedback
                      _submitFeedback('Sad');
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('We appreciate your feedback and will strive to improve!')),
                      );
                    },
                    child: Column(
                      children: [
                        Text(
                          '😔',
                          style: TextStyle(fontSize: 40),
                        ),
                        Text('Sad'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _shareApp() {
    final box = context.findRenderObject() as RenderBox?;
    Share.share(
      'Check out Agronomix App! It helps farmers solve their plant problems.',
      subject: 'Agronomix App',
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );
  }

  void _submitFeedback(String feedback) {
    FirebaseFirestore.instance.collection('feedbacks').add({
      'feedback': feedback,
      'timestamp': FieldValue.serverTimestamp(),
    }).then((value) {
      print('Feedback submitted successfully');
    }).catchError((error) {
      print('Failed to submit feedback: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen.shade800,
        toolbarHeight: 260,
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 50.0, 120.0, 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  maxRadius: 50,
                  child: Image.asset(
                    'assets/img/user2.png',
                    width: 100,
                    height: 100,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'User Name', // Replace with the user's name
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Joined: month day, year', // Replace with the joined date
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 180,
              color: Colors.white,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        'assets/img/plant.png',
                        width: 150,
                        height: 150,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 200,
                      color: Colors.white,
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                            child: Text(
                              'Grow smart together!',
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12.0),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                            child: Text(
                              'Share Agronomix and help farmers solve their plant problems.',
                              style: TextStyle(color: Colors.black, fontSize: 10.0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 1.0, left: 30.0),
                            child: TextButton(
                              onPressed: _shareApp,
                              child: Text(
                                'Share Now',
                                style: TextStyle(color: Colors.green, fontSize: 14.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2),
            Container(
              height: 180,
              color: Colors.white,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        'assets/img/feedback.png',
                        width: 150,
                        height: 150,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 200,
                      color: Colors.white,
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                            child: Text(
                              'How is your experience with Agronomix App?',
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12.0),
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                            child: Text(
                              'We’d love to hear your thoughts and suggestions.',
                              style: TextStyle(color: Colors.black, fontSize: 10.0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 1.0, left: 30.0),
                            child: TextButton(
                              onPressed: _showFeedbackDialog,
                              child: Text(
                                'Give feedback',
                                style: TextStyle(color: Colors.green, fontSize: 14.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
