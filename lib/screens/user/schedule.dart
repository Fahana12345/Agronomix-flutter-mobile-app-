import 'package:agronomix/screens/user/crop_saved.dart';
import 'package:agronomix/screens/user/schedule1.dart';
import 'package:agronomix/screens/saved_crops.dart'; // Import the new screen
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  TextEditingController _cropController = TextEditingController();

  final _infoKey = GlobalKey<FormState>();
  String? _selectedType; // Changed from _selectedGender to _selectedType for clarity

  Future<void> _saveData() async {
    if (_infoKey.currentState!.validate()) {
      try {
        await FirebaseFirestore.instance.collection('crops').add({
          'name': _cropController.text,
          'type': _selectedType,
          'timestamp': DateTime.now(),
        });
        _cropController.clear();
        setState(() {
          _selectedType = null;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Crop data saved successfully')),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SavedCrops()),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save crop data')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen.shade900,
        title: Text("Schedule Tasks"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        color: Colors.lightGreen.shade100,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/img/crop1.jpg'),
                  ),
                  SizedBox(height: 20),
                  Form(
                    key: _infoKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.name,
                          controller: _cropController,
                          cursorColor: Colors.green,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.lightGreen[50],
                            hintText: "Crop Name",
                            prefixIcon: Icon(Icons.eco, color: Colors.green),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey[300]!, width: 1.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.green, width: 1.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter crop name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),

                        Text("Type", style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            Radio<String>(
                              value: 'Fruit',
                              groupValue: _selectedType,
                              activeColor: Colors.green,
                              onChanged: (value) {
                                setState(() {
                                  _selectedType = value;
                                });
                              },
                            ),
                            Text("Fruits"),
                            Radio<String>(
                              value: 'Vegetables',
                              activeColor: Colors.green,
                              groupValue: _selectedType,
                              onChanged: (value) {
                                setState(() {
                                  _selectedType = value;
                                });
                              },
                            ),
                            Text("Vegetables"),
                          ],
                        ),
                        SizedBox(height: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: _saveData,
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.save_alt, size: 16),
                                  SizedBox(width: 8),
                                  Text('Save'),
                                ],
                              ),
                            ),
                            SizedBox(width: 10), // Add spacing between the buttons
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => CropSaved()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.list_alt, size: 16),
                                  SizedBox(width: 8),
                                  Text('Saved Crops'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
