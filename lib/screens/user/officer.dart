import 'package:agronomix/screens/user/About1.dart';
import 'package:agronomix/screens/user/About2.dart';
import 'package:agronomix/screens/user/About3.dart';

import 'package:flutter/material.dart';



class OfficerPage extends StatefulWidget {
  const OfficerPage({Key? key}) : super(key: key);

  @override
  State<OfficerPage> createState() => _OfficerPageState();
}

class _OfficerPageState extends State<OfficerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen.shade100,
      ),

      body: Container(
        color: Colors.lightGreen.shade100,
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(16), // Optional padding for spacing
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(64, 10, 10, 10),
              child: Text(
                'Our Officers Team',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20), // Add spacing between elements
            Container(
              padding: EdgeInsets.all(15),
              height: 130,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.lightGreen[50],
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: 15, // Positioning relative to left edge
                    top: 45, // Centering vertically
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => About1()));
                      },
                      child: Text(
                        "About",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Column(
                    children: [


                  Positioned(
                    left: 20, // Positioning relative to right edge
                    top: 5, // Aligning to the top-right
                    child: Image.asset(
                      
                      'assets/img/profile.jpg',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    
                  ),

                  SizedBox(height: 10,),
                  Text("Diagnostic Lab Officers",style: TextStyle(fontWeight: FontWeight.bold),),

                  ]
                  ),

                ],

              ),

            ),
            SizedBox(height: 35),
            Container(
              padding: EdgeInsets.all(15),
              height: 130,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.lightGreen[50],
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: 15, // Positioning relative to left edge
                    top: 45, // Centering vertically
                    child: ElevatedButton(

                      style: ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen,),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => About2()));
                      },
                      child: Text(
                        "About",
                        style: TextStyle(color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [


                  Positioned(
                    left: 20, // Positioning relative to right edge
                    top: 5, // Aligning to the top-right
                    child: Image.asset(
                      'assets/img/profile.jpg',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("Agriculture officers",style: TextStyle(fontWeight: FontWeight.bold),),

                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 35,),
            Container(
              padding: EdgeInsets.all(15),
              height: 130,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.lightGreen[50],
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: 15, // Positioning relative to left edge
                    top: 45, // Centering vertically
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => About3()));
                      },
                      child: Text(
                        "About",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Column(
                    children: [


                  Positioned(
                    left: 20, // Positioning relative to right edge
                    top:5, // Aligning to the top-right
                    child: Image.asset(
                      'assets/img/profile.jpg',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("Cheif Agriculture Officers",style: TextStyle(fontWeight: FontWeight.bold),),

                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 35,),
          ],
        ),
      ),
    );
  }
}

