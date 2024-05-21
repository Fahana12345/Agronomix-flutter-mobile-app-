import 'package:flutter/material.dart';

class Plant {
  final String name;
  final List<String> diseases;

  Plant({required this.name, required this.diseases});
}

final List<Plant> vegetables = [
  Plant(name: 'Tomato', diseases: ['Blight', 'Mosaic Virus', 'Root Rot']),
  Plant(name: 'Potato', diseases: ['Late Blight', 'Early Blight', 'Scab']),
  Plant(name: 'Chilli', diseases: ['Bacteria', 'Damping off', 'Powdery mildew']),
  Plant(name: 'Brinjal', diseases: ['Moko Eggplant', 'Elliphant fruit and shoot borer', 'Verticillium wilt']),
  Plant(name: 'Ladyfinger', diseases: ['Leaf spot', 'Fusarium wilt', 'Powdery mildew']),
  Plant(name: 'Cabbage', diseases: ['Black Rot', 'Downy Mildew', 'Clubroot']),
  Plant(name: 'Carrot', diseases: ['Alternaria Leaf Blight', 'Cavity Spot', 'Root Knot Nematode']),
  Plant(name: 'Cucumber', diseases: ['Angular Leaf Spot', 'Anthracnose', 'Downy Mildew']),
  Plant(name: 'Pepper', diseases: ['Bacterial Leaf Spot', 'Cucumber Mosaic Virus', 'Powdery Mildew']),
  Plant(name: 'Spinach', diseases: ['Downy Mildew', 'White Rust', 'Leaf Spot']),
];

final List<Plant> fruits = [
  Plant(name: 'Apple', diseases: ['Apple Scab', 'Fire Blight', 'Powdery Mildew']),
  Plant(name: 'Banana', diseases: ['Black Sigatoka', 'Panama Disease', 'Bunchy Top']),
  Plant(name: 'Grapes', diseases: ['Downy Mildew', 'Powdery Mildew', 'Black Rot']),
  Plant(name: 'Mango', diseases: ['Anthracnose', 'Powdery Mildew', 'Bacterial Canker']),
  Plant(name: 'Orange', diseases: ['Citrus Canker', 'Citrus Greening', 'Citrus Black Spot']),
  Plant(name: 'Pineapple', diseases: ['Heart Rot', 'Black Rot', 'Fusariosis']),
  Plant(name: 'Strawberry', diseases: ['Gray Mold', 'Powdery Mildew', 'Leaf Spot']),
  Plant(name: 'Watermelon', diseases: ['Anthracnose', 'Downy Mildew', 'Fusarium Wilt']),
  Plant(name: 'Peach', diseases: ['Peach Leaf Curl', 'Brown Rot', 'Bacterial Spot']),
  Plant(name: 'Papaya', diseases: ['Anthracnose', 'Powdery Mildew', 'Papaya Ringspot Virus']),
];

class PestIdentificationScreen extends StatefulWidget {
  @override
  _PestIdentificationScreenState createState() => _PestIdentificationScreenState();
}

class _PestIdentificationScreenState extends State<PestIdentificationScreen> {
  String? selectedType;
  String? selectedPlant;
  String? selectedDisease;
  List<Plant> plants = [];
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
                items: plants.map((Plant plant) {
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
