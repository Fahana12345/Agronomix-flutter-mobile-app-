import 'package:flutter/material.dart';

class CropMonitoringDiagnostic extends StatefulWidget {
  const CropMonitoringDiagnostic({super.key});

  @override
  State<CropMonitoringDiagnostic> createState() => _CropMonitoringDiagnosticState();
}

class _CropMonitoringDiagnosticState extends State<CropMonitoringDiagnostic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen.shade900,
        title: Text("Crops Monitoring"),
      ),
    );
  }
}
