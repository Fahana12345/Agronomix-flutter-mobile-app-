import 'package:agronomix/screens/user/expense.dart';
import 'package:agronomix/screens/user/officer.dart';
import 'package:agronomix/screens/user/schedule.dart';
import 'package:agronomix/screens/user/pest.dart';
import 'package:agronomix/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.lightGreen.shade900,
        title: Text('Agronomix'),
        actions: [

          IconButton(onPressed: () async{

            AuthService().logout().then((value) => Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false ));




          }, icon: Icon(Icons.logout))
        ],

      ),
      body: Container(
        color: Colors.lightGreen.shade100,
        padding: EdgeInsets.all(10),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              padding: EdgeInsets.all(15),
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.lightGreen[50],
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0,3),
                    )
                  ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.white70),
                          onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>OfficerPage()));
                          },
                          child: Text("Officer and Diagnostic lab", style: TextStyle(color: Colors.black),)


                      ),

                    ],
                  ),
                  Expanded( // Added Expanded widget here
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          'assets/img/offficer1.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        )
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 35,),
            Container(
              padding: EdgeInsets.all(15),
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.lightGreen[50],
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0,3),
                    )
                  ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.white70),
                          onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>PestPage()));
                          },
                          child: Text("Pest identification", style: TextStyle(color: Colors.black),)
                      ),
                    ],
                  ),
                  Expanded( // Added Expanded widget here
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          'assets/img/pest1.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        )
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 35,),
            Container(
              padding: EdgeInsets.all(15),
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.lightGreen[50],
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0,3),
                    )
                  ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.white70),
                          onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context)=>SchedulePage()));
                          },
                          child: Text("Schedules Tasks", style: TextStyle(color: Colors.black),)
                      ),
                    ],
                  ),
                  Expanded( // Added Expanded widget here
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          'assets/img/scheduleicon.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        )
                    ),
                  )
                ],

              ),
            ),
            SizedBox(height: 35,),
            Container(
                height: 100,

                width: MediaQuery.of(context).size.width,
                child: Stack(


                  children: [





                    Center(
                      child: Container(

                        height: 100,
                        padding: EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.lightGreen[50],
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.8),

                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0,3),
                            )
                          ]
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [

                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Text('Estimate your field profit',
                                  style: TextStyle(fontWeight: FontWeight.bold),),
                                Text('    by keeping track your expenses'),
                              ],
                            ),
                            Expanded( // Added Expanded widget here
                              child:InkWell(
                                onTap: (){
                                  Navigator.push(context,MaterialPageRoute(builder: (context)=>ExpensePage()));
                                },
                                child: Align(

                                    alignment: Alignment.centerRight,
                                    child: Image.asset(
                                      'assets/img/rupeicon.png',
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    )

                                ),
                              ),
                            )



                          ],
                        ),

                      ),

                    ),






                  ],


                )
            ),



          ],
        ),
      ),
    );
  }
}