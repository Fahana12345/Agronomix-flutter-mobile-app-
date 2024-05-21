import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(PestIdentifierApp());
}

class PestIdentifierApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pest Identifier',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: PestIdentificationPage(),
    );
  }
}

class PestIdentificationPage extends StatefulWidget {
  @override
  _PestIdentificationPageState createState() => _PestIdentificationPageState();
}

class _PestIdentificationPageState extends State<PestIdentificationPage> {
  File? _image;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen.shade900,
        title: Text('Pest Identifier'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Identify pests in your plants',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.lightGreen.shade900,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton.icon(
              onPressed: _pickImage,
              icon: Icon(Icons.camera_alt, color: Colors.lightGreen.shade900),
              label: Text(
                'Upload Plant Image',
                style: TextStyle(color: Colors.lightGreen.shade900),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Background color
              ),
            ),
            SizedBox(height: 20.0),
            _image != null
                ? Image.file(
              _image!,
              height: 200,
              width: 200,
            )
                : Text('No image selected'),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Enter Plant Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.lightGreen.shade900,
                    width: 1.3,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.lightGreen.shade900,
                    width: 2.0,
                  ),
                ),
              ),
              onChanged: (text) {
                // Implement functionality to analyze text input
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Implement pest identification logic
              },
              child: Text(
                'Identify Pests',
                style: TextStyle(color: Colors.lightGreen.shade900),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
