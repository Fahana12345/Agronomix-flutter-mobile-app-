



import 'package:agronomix/screens/addplants.dart';
import 'package:agronomix/screens/profilepage.dart';
import 'package:agronomix/screens/user/officer.dart';
import 'package:agronomix/screens/user/schedule.dart';
import 'package:agronomix/screens/user/weatherpage.dart';
import 'package:flutter/material.dart';

import 'userhome_page.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {

  int _selectedIndex=0;

  List<Widget> _widgetOptions=[

    HomePage(),
    ProfilePage(),
    AddPlants(),
    WeatherPage(),
    SchedulePage(),
    OfficerPage(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.lightGreen.shade900,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: BottomNavigationBar(

              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.black,
              showSelectedLabels:false,

              onTap: (value){
                setState(() {
                  _selectedIndex=value;
                });
              },
              currentIndex:_selectedIndex,
              backgroundColor: Colors.black,

              items: [

                BottomNavigationBarItem(icon: Icon(Icons.home_filled,color: Colors.black,),label: "Home", backgroundColor: Colors.white,),
                BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.black,),label: "Home", backgroundColor: Colors.white,),
                BottomNavigationBarItem(icon: Icon(Icons.eco,color: Colors.black,),label: "Bookmark", backgroundColor: Colors.white,),
                BottomNavigationBarItem(icon: Icon(Icons.cloud_circle,color: Colors.black,),label: "Bookmark", backgroundColor: Colors.white,),


              ],
            ),
          ),
        ),



        body: _widgetOptions.elementAt(_selectedIndex)
    );
  }
}