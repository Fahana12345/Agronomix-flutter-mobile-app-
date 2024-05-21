// import 'package:agronomix/screens/admin/admin_home_page.dart';
// import 'package:agronomix/screens/common/register_page.dart';
// import 'package:agronomix/screens/common/splash_page.dart';
// import 'package:agronomix/screens/forgotpassword_page.dart';
// import 'package:agronomix/screens/profilepage.dart';
// import 'package:agronomix/screens/userhome_page.dart';
// import 'package:agronomix/screens/user/officer.dart';
// import 'package:agronomix/screens/user/schedule.dart';
// import 'package:flutter/material.dart';
// import 'package:agronomix/screens/common/login_page.dart';
// import 'package:agronomix/screens/bottomnavigator.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: 'bottomnavigation',
//       routes: {
//         '/':(context)=>const SplashPage(),
//         'login':(context)=>LoginPage(),
//         'forgotpassword':(context)=>Forgotpassword(),
//         'register':(context)=>RegisterPage(),
//         'homepage':(context)=>HomePage(),
//         'bottomnavigation':(context)=>BottomNavigationPage(),
//         'schedule':(context)=>SchedulePage(),
//         'officer':(context)=>OfficerPage(),
//         'adminhome':(context)=>AdminHome(),
//         'profilepage':(context)=>ProfilePage(),
//
//       },
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//
//
//           appBarTheme: AppBarTheme(
//               centerTitle: true,
//               titleTextStyle: TextStyle(color:Colors.white,fontSize: 18),
//
//
//
//               iconTheme: IconThemeData(color: Colors.white)
//           ),
//           textTheme: TextTheme(
//               displayLarge: TextStyle(
//                 fontSize: 32,
//                 fontWeight: FontWeight.w500,
//               ),
//
//
//               displaySmall: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.w300,
//               )
//           )
//       ),
//
//     );
//   }
// }
//



import 'package:agronomix/officerthree/offcier_three_home.dart';
import 'package:agronomix/officertwo/officer_two_home.dart';
import 'package:agronomix/screens/addplants.dart';

import 'package:agronomix/screens/admin/admin_home_page.dart';
import 'package:agronomix/screens/admin/officer1_register.dart';
import 'package:agronomix/screens/admin/view_all_agricultre_offcier.dart';
import 'package:agronomix/screens/admin/view_all_chief_officer.dart';
import 'package:agronomix/screens/admin/view_all_diagnostic_offcier.dart';
import 'package:agronomix/screens/offcierOne/officer1home.dart';
import 'package:agronomix/screens/common/register_page.dart';
import 'package:agronomix/screens/common/splash_page.dart';
import 'package:agronomix/screens/forgotpassword_page.dart';
import 'package:agronomix/screens/profilepage.dart';
import 'package:agronomix/screens/user/About1.dart';
import 'package:agronomix/screens/user/About2.dart';
import 'package:agronomix/screens/user/About3.dart';

import 'package:agronomix/screens/userhome_page.dart';
import 'package:agronomix/screens/user/officer.dart';
import 'package:agronomix/screens/user/schedule.dart';

import 'package:flutter/material.dart';
import 'package:agronomix/screens/common/login_page.dart';
import 'package:agronomix/screens/bottomnavigator.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'package:share_plus/share_plus.dart';


// Import chat-related files
import 'chat_page.dart';
import 'chat_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
    MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashPage(),
          'login': (context) => LoginPage(),
          'forgotpassword': (context) => Forgotpassword(),
          'register': (context) => RegisterPage(),
          'homepage': (context) => HomePage(),
          'bottomnavigation': (context) => BottomNavigationPage(),
          'schedule': (context) => SchedulePage(),
          'officer': (context) => OfficerPage(),
          'adminhome': (context) => AdminHome(),
          'profilepage': (context) => ProfilePage(),
          'addplants': (context) => AddPlants(),

          'officer1reg': (context) => Officer1Register(),
           'officer1home': (context) => OfficerOneHomePage(),
           'officer2home': (context) => OfficerTwoHomePage(),
           'officer3home': (context) => OfficerThreeHomePage(),
          // Add the ChatPage route
          'about1':(context)=> About1(),
          'about2':(context)=> About2(),
          'about3':(context)=> About3(),

          'ViewAllDiagOfficersScreen':(context)=>ViewAllDiagOfficersScreen(),
          'ViewAllAgriOfficersScreen':(context)=>ViewAllAgriOfficersScreen(),
          'ViewAllchiefOfficersScreen':(context)=>ViewAllChiefOfficersScreen()

        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            centerTitle: true,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            iconTheme: IconThemeData(color: Colors.white),
          ),
          textTheme: TextTheme(
            displayLarge: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w500,
            ),
            displaySmall: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),

    );
  }
}
