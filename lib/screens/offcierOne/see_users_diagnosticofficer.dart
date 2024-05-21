import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeeUsersDiagnostic extends StatefulWidget {
  const SeeUsersDiagnostic({super.key});

  @override
  State<SeeUsersDiagnostic> createState() => _SeeUsersDiagnosticState();
}

class _SeeUsersDiagnosticState extends State<SeeUsersDiagnostic> {
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
