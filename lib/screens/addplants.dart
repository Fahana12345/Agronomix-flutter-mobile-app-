
import 'package:agronomix/screens/saved_crops.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddPlants extends StatefulWidget {
  const AddPlants({Key? key}) : super(key: key);

  @override
  _AddPlantsState createState() => _AddPlantsState();
}

class _AddPlantsState extends State<AddPlants> {
  TextEditingController _plantName = TextEditingController();
  TextEditingController _plantType = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<void> _saveData() async {
    if (_formKey.currentState!.validate()) {
      try {
        await FirebaseFirestore.instance.collection('plants').add({
          'name': _plantName.text,
          'type': _plantType.text,
          'timestamp': DateTime.now(),
        });
        _plantName.clear();
        _plantType.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Plant data saved successfully')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save plant data')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Plants"),
        backgroundColor: Colors.lightGreen.shade900,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _plantName,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter Plant's name";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Plant\'s Name',
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _plantType,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter plant's type";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Plant\'s Type',
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: 150, // Set your desired width here
                  child: ElevatedButton(
                    onPressed: _saveData,
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.lightGreen.shade900),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SavedCrops()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  minimumSize: MaterialStateProperty.all<Size>(Size(100, 48)),
                ),
                child: Text(
                  "Saved Crops",
                  style: TextStyle(color: Colors.lightGreen.shade900),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
