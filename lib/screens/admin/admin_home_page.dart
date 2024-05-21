import 'package:agronomix/screens/admin/officer1_register.dart';
import 'package:agronomix/screens/admin/officer2_register.dart';
import 'package:agronomix/screens/admin/officer3_register.dart';
import 'package:agronomix/screens/admin/view_all_chief_officer.dart';
import 'package:agronomix/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:agronomix/screens/common/register_page.dart';
import 'package:agronomix/screens/common/login_page.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen.shade100,
        actions: [

          IconButton(onPressed: () async{

            AuthService().logout().then((value) => Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false ));




          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Container(
        color: Colors.lightGreen.shade100,
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 100, top: 10, bottom: 20),
                  child: Text(
                    'Admin Page',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/img/profile.jpg',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text("Diagnostic Lab Officer",style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Spacer(), // Add space between profile info and buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightGreen,
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Officer1Register()));
                                },
                                child: Text(
                                  "Add",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              SizedBox(width: 10),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightGreen,
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, 'ViewAllDiagOfficersScreen');
                                },
                                child: Text(
                                  "View",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                  ),
                ),
                SizedBox(height: 20), // Add spacing between containers
                Expanded(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/img/profile.jpg',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text("Agriculture Officer",style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Spacer(), // Add space between profile info and buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightGreen,
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Officer2Register()));
                                },
                                child: Text(
                                  "Add",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              SizedBox(width: 10),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightGreen,
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, 'ViewAllAgriOfficersScreen');
                                },
                                child: Text(
                                  "View",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                  ),
                ),
                SizedBox(height: 20), // Add spacing between containers
                Expanded(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(

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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/img/profile.jpg',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  Text("Chief Agriculture Officer",style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Spacer(), // Add space between profile info and buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightGreen,
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Officer3Register()));
                                },
                                child: Text(
                                  "Add",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              SizedBox(width: 10),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightGreen,
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, 'ViewAllchiefOfficersScreen');
                                },
                                child: Text(
                                  "View",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
