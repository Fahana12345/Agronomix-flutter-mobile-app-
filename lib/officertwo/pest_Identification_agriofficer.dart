import 'package:flutter/material.dart';

class PestIdentification {
  final String name;
  final List<String> diseases;

  PestIdentification({required this.name, required this.diseases});
}

final List<PestIdentification> vegetables = [
  PestIdentification(name: 'Tomato', diseases: ['Blight', 'Mosaic Virus', 'Root Rot']),
  PestIdentification(name: 'Potato', diseases: ['Late Blight', 'Early Blight', 'Scab']),
  PestIdentification(name: 'Chilli', diseases: ['Bacteria', 'Damping off', 'Powdery mildew']),
  PestIdentification(name: 'Brinjal', diseases: ['Moko Eggplant', 'Elliphant fruit and shoot borer', 'Verticillium wilt']),
  PestIdentification(name: 'Ladyfinger', diseases: ['Leaf spot', 'Fusarium wilt', 'Powdery mildew']),
  PestIdentification(name: 'Cabbage', diseases: ['Black Rot', 'Downy Mildew', 'Clubroot']),
  PestIdentification(name: 'Carrot', diseases: ['Alternaria Leaf Blight', 'Cavity Spot', 'Root Knot Nematode']),
  PestIdentification(name: 'Cucumber', diseases: ['Angular Leaf Spot', 'Anthracnose', 'Downy Mildew']),
  PestIdentification(name: 'Pepper', diseases: ['Bacterial Leaf Spot', 'Cucumber Mosaic Virus', 'Powdery Mildew']),
  PestIdentification(name: 'Spinach', diseases: ['Downy Mildew', 'White Rust', 'Leaf Spot']),
];

final List<PestIdentification> fruits = [
  PestIdentification(name: 'Apple', diseases: ['Apple Scab', 'Fire Blight', 'Powdery Mildew']),
  PestIdentification(name: 'Banana', diseases: ['Black Sigatoka', 'Panama Disease', 'Bunchy Top']),
  PestIdentification(name: 'Grapes', diseases: ['Downy Mildew', 'Powdery Mildew', 'Black Rot']),
  PestIdentification(name: 'Mango', diseases: ['Anthracnose', 'Powdery Mildew', 'Bacterial Canker']),
  PestIdentification(name: 'Orange', diseases: ['Citrus Canker', 'Citrus Greening', 'Citrus Black Spot']),
  PestIdentification(name: 'Pineapple', diseases: ['Heart Rot', 'Black Rot', 'Fusariosis']),
  PestIdentification(name: 'Strawberry', diseases: ['Gray Mold', 'Powdery Mildew', 'Leaf Spot']),
  PestIdentification(name: 'Watermelon', diseases: ['Anthracnose', 'Downy Mildew', 'Fusarium Wilt']),
  PestIdentification(name: 'Peach', diseases: ['Peach Leaf Curl', 'Brown Rot', 'Bacterial Spot']),
  PestIdentification(name: 'Papaya', diseases: ['Anthracnose', 'Powdery Mildew', 'Papaya Ringspot Virus']),
];

class PestIdentificationScreen extends StatefulWidget {
  @override
  _PestIdentificationScreenState createState() => _PestIdentificationScreenState();
}

class _PestIdentificationScreenState extends State<PestIdentificationScreen> {
  String? selectedType;
  String? selectedPlant;
  String? selectedDisease;
  List<PestIdentification> plants = [];
  List<String> diseases = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade100,
      appBar: AppBar(
        title: Text('Pest Identification'),
        backgroundColor: Colors.lightGreen.shade900,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              hint: Text('Select Type'),
              value: selectedType,
              isExpanded: true,
              items: ['Vegetable', 'Fruit'].map((String type) {
                return DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedType = value;
                  selectedPlant = null;
                  selectedDisease = null;
                  if (value == 'Vegetable') {
                    plants = vegetables;
                  } else {
                    plants = fruits;
                  }
                  diseases = [];
                });
              },
            ),
            SizedBox(height: 20),
            if (selectedType != null)
              DropdownButton<String>(
                hint: Text('Select Plant'),
                value: selectedPlant,
                isExpanded: true,
                items: plants.map((PestIdentification plant) {
                  return DropdownMenuItem<String>(
                    value: plant.name,
                    child: Text(plant.name),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedPlant = value;
                    diseases = plants.firstWhere((plant) => plant.name == value!).diseases;
                    selectedDisease = null;
                  });
                },
              ),
            SizedBox(height: 20),
            if (selectedPlant != null)
              Text(
                'Diseases for $selectedPlant:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: diseases.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(diseases[index]),
                    onTap: () {
                      setState(() {
                        selectedDisease = diseases[index];
                      });
                    },
                  );
                },
              ),
            ),
            if (selectedDisease != null)
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  'Selected Disease: $selectedDisease',
                  style: TextStyle(fontSize: 20),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PestIdentificationScreen(),
  ));
}
