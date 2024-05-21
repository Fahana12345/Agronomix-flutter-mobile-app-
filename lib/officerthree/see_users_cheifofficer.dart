import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheifUsers extends StatefulWidget {
  const CheifUsers({super.key});

  @override
  State<CheifUsers> createState() => _CheifUsersState();
}

class _CheifUsersState extends State<CheifUsers> {
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
