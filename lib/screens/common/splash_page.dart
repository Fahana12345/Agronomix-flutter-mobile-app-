import 'package:flutter/material.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 7),
          () {
        Navigator.pushReplacementNamed(context, 'login');
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade100,
      body: Center(
        child: Container(
          width: 150, // Adjust the width as needed
          height: 150, // Adjust the height as needed
          decoration: BoxDecoration(
            color: Colors.lightGreen.shade100,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0), // Adjust padding as needed
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                'assets/img/logo.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
