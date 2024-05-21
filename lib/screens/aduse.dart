// // import 'package:flutter/material.dart';
// //
// // class AdminHomePage extends StatefulWidget {
// //   const AdminHomePage({super.key});
// //
// //   @override
// //   State<AdminHomePage> createState() => _AdminHomePageState();
// // }
// //
// // class _AdminHomePageState extends State<AdminHomePage> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         backgroundColor: Colors.lightGreen.shade600,
// //         title: Text("Admin Home"),
// //       ),
// //       body: Padding(
// //         padding: EdgeInsets.all(16), // General padding for the entire body
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           children: [
// //             // First row of containers with Expanded to fit evenly
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween, // To distribute space evenly
// //               children: [
// //                 Expanded(
// //                   child: Container(
// //                     height: 150,
// //                     padding: EdgeInsets.all(20),
// //                     margin: EdgeInsets.symmetric(horizontal: 10), // Margin between containers
// //                     decoration: BoxDecoration(
// //                       color: Colors.lightGreen[50],
// //                       borderRadius: BorderRadius.circular(15),
// //                       boxShadow: [
// //                         BoxShadow(
// //                           color: Colors.grey.withOpacity(0.8),
// //                           spreadRadius: 5,
// //                           blurRadius: 7,
// //                           offset: Offset(0, 3),
// //                         ),
// //                       ],
// //                     ),
// //                     child: Center(child: Text("Container 1")),
// //                   ),
// //                 ),
// //
// //                 Expanded(
// //                   child: Container(
// //                     height: 150,
// //                     padding: EdgeInsets.all(20),
// //                     margin: EdgeInsets.symmetric(horizontal: 10), // Margin between containers
// //                     decoration: BoxDecoration(
// //                       color: Colors.lightGreen[50],
// //                       borderRadius: BorderRadius.circular(15),
// //                       boxShadow: [
// //                         BoxShadow(
// //                           color: Colors.grey.withOpacity(0.8),
// //                           spreadRadius: 5,
// //                           blurRadius: 7,
// //                           offset: Offset(0, 3),
// //                         ),
// //                       ],
// //                     ),
// //                     child: Center(child: Text("Container 2")),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //             // Second row with one container
// //             SizedBox(height: 35,),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.center, // To center the container
// //               children: [
// //                 Container(
// //                   height: 150,
// //                   width: 150,
// //                   padding: EdgeInsets.all(20),
// //                   margin: EdgeInsets.symmetric(horizontal: 10), // Margin between containers
// //                   decoration: BoxDecoration(
// //                     color: Colors.lightGreen[50],
// //                     borderRadius: BorderRadius.circular(15),
// //                     boxShadow: [
// //                       BoxShadow(
// //                         color: Colors.grey.withOpacity(0.8),
// //                         spreadRadius: 5,
// //                         blurRadius: 7,
// //                         offset: Offset(0, 3),
// //                       ),
// //                     ],
// //                   ),
// //                   child: Center(child: Text("Container 3")), // Content of the new container
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// import 'package:agronomix/screens/common/login_page.dart';
// import 'package:agronomix/screens/common/register_page.dart';
// import 'package:agronomix/screens/user/chat1.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
//
//
// class AdminHome extends StatefulWidget {
//   const AdminHome({Key? key}) : super(key: key);
//
//   @override
//   State<AdminHome> createState() => _AdminHomeState();
// }
//
// class _AdminHomeState extends State<AdminHome> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.lightGreen.shade100,
//       ),
//
//       body: Container(
//         color: Colors.lightGreen.shade100,
//         height: double.infinity,
//         width: double.infinity,
//         padding: EdgeInsets.all(16), // Optional padding for spacing
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.fromLTRB(100, 10, 10, 10),
//               child: Text(
//                 'Admin Page',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             SizedBox(height: 20), // Add spacing between elements
//             Container(
//               padding: EdgeInsets.all(15),
//               height: 130,
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 color: Colors.lightGreen[50],
//                 borderRadius: BorderRadius.circular(15),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.8),
//                     spreadRadius: 5,
//                     blurRadius: 7,
//                     offset: Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: Stack(
//                 children: [
//                   Positioned(
//                     right: 15, // Positioning relative to left edge
//                     top: 45, // Centering vertically
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen),
//                       onPressed: () {
//                         Navigator.push(context,MaterialPageRoute(builder: (context)=>RegisterPage()));
//
//                       },
//                       child: Text(
//                         "Register",
//                         style: TextStyle(color: Colors.black),
//                       ),
//                     ),
//                   ),
//                   Column(
//                     children: [
//
//
//                   Positioned(
//                     left: 20, // Positioning relative to right edge
//                     top: 5, // Aligning to the top-right
//                     child: Image.asset(
//
//                       'assets/img/profile.jpg',
//                       width: 50,
//                       height: 50,
//                       fit: BoxFit.cover,
//                     ),
//
//                   ),
//                   SizedBox(height: 10,),
//                   Text("Officer1",style: TextStyle(fontWeight: FontWeight.bold),),
//                       Text("Agriculture Officer")
//
//                 ],
//
//               ),
//                 ],
//               )
//             ),
//             SizedBox(height: 35),
//             Container(
//               padding: EdgeInsets.all(15),
//               height: 130,
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 color: Colors.lightGreen[50],
//                 borderRadius: BorderRadius.circular(15),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.8),
//                     spreadRadius: 5,
//                     blurRadius: 7,
//                     offset: Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: Stack(
//                 children: [
//                   Positioned(
//                     right: 15, // Positioning relative to left edge
//                     top: 45, // Centering vertically
//                     child: ElevatedButton(
//
//                       style: ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen,),
//                       onPressed: () {
//                         Navigator.push(context,MaterialPageRoute(builder: (context)=>RegisterPage()));
//
//                       },
//                       child: Text(
//                         "Register",
//                         style: TextStyle(color: Colors.black,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Column(
//                     children: [
//
//
//                   Positioned(
//
//                     left: 20, // Positioning relative to right edge
//                     top: 5, // Aligning to the top-right
//                     child: Image.asset(
//                       'assets/img/profile.jpg',
//                       width: 50,
//                       height: 50,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   SizedBox(height: 10,),
//                   Text("Officer2",style: TextStyle(fontWeight: FontWeight.bold),),
//                       Text("Chief Agriculture Officer")
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 35,),
//             Container(
//               padding: EdgeInsets.all(15),
//               height: 130,
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 color: Colors.lightGreen[50],
//                 borderRadius: BorderRadius.circular(15),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.8),
//                     spreadRadius: 5,
//                     blurRadius: 7,
//                     offset: Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: Stack(
//                 children: [
//                   Positioned(
//                     right: 15, // Positioning relative to left edge
//                     top: 45, // Centering vertically
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen),
//
//                       onPressed: () {
//
//                         Navigator.push(context,MaterialPageRoute(builder: (context)=>RegisterPage()));
//                       },
//                       child: Text(
//                         "Register",
//                         style: TextStyle(color: Colors.black),
//                       ),
//                     ),
//                   ),
//                   Column(
//                     children: [
//
//
//                       Positioned(
//                         left: 20, // Positioning relative to right edge
//                          top: 0,// Aligning to the top-right
//                         child: Image.asset(
//                           'assets/img/profile.jpg',
//                           width: 50,
//                           height: 50,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       SizedBox(height: 10,),
//                       Text("Officer3",style: TextStyle(fontWeight: FontWeight.bold),),
//                       Text("Diagnostic Lab Officer")
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 35,),
//           ],
//         ),
//       ),
//     );
//   }
// }
//





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
      ),
      body: Container(
        color: Colors.lightGreen.shade100,
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(100, 10, 10, 10),
              child: Text(
                'Admin Page',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
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
              
              child: Column(
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end, // Align buttons to the end
                  //   children: [
                  //     Image.asset("assets/img/profile.jpg",
                  //     width: 60,
                  //       height: 60,
                  //       fit: BoxFit.cover,
                  //     ),
                  Positioned(
                    left: 5, // Positioning relative to right edge
                    top:5, // Aligning to the top-right
                    child: Image.asset(
                      'assets/img/profile.jpg',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("Admin3",style: TextStyle(fontWeight: FontWeight.bold),),
                  Text("Diagnostic Lab Officer"),


                      ElevatedButton(

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightGreen,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => LoginPage()));
                        },
                        child: Text(
                          "Add",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      SizedBox(width: 10), // Space between buttons
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightGreen,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => RegisterPage()));
                        },
                        child: Text(
                          "View",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),

              ),

            // Additional Containers and other widgets would go here...
          ],
        ),
      ),
    );
  }
}