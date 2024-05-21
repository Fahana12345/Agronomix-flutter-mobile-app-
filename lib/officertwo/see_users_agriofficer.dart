import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AricultureUsers extends StatefulWidget {
  const AricultureUsers({super.key});

  @override
  State<AricultureUsers> createState() => _AricultureUsersState();
}

class _AricultureUsersState extends State<AricultureUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen.shade900,
        title: Text("Users"),
      ),
    );
  }
}
