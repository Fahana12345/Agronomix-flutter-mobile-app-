import 'package:flutter/material.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({super.key});

  @override
  _ExpensePageState createState() => _ExpensePageState();
}

class _ExpensePageState extends State<ExpensePage> {
  // Controllers for text fields to retrieve user input
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _pricePerUnitController = TextEditingController();

  // Variable to hold the calculated result
  double _totalPrice = 0.0;

  void _calculateTotalPrice() {
    // Retrieve values from text fields and convert them to double
    final double quantity = double.tryParse(_quantityController.text) ?? 0;
    final double pricePerUnit = double.tryParse(_pricePerUnitController.text) ?? 0;

    // Calculate the total price
    setState(() {
      _totalPrice = quantity * pricePerUnit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen.shade900,
        title: Text('Crop Price Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Enter the crop name:'),
            TextField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Crop Name ',
              ),
            ),
            SizedBox(height: 20),
            Text('Enter the Quantity of crops'),
            TextField(
              controller: _pricePerUnitController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter Quantity in kg',
              ),
            ),
            SizedBox(height: 20),
            Text('Enter the price per unit:'),
            TextField(
              controller: _pricePerUnitController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter price per kg',
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:Colors.lightGreen,
                ),
                onPressed: _calculateTotalPrice,
                child: Text('Calculate Total Price',style: TextStyle(color: Colors.black),
              ),
            ),
            ),
            SizedBox(height: 20),
            Center(child: Text('Total Price: \$$_totalPrice',style: TextStyle(color:Colors.black),)),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ExpensePage(),
  ));
}