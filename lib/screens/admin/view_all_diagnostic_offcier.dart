import 'package:agronomix/models/cheif_officer_model.dart';
import 'package:flutter/material.dart';
import 'package:agronomix/models/diagnostic_officer_model.dart';

import '../../services/office_one_service.dart';


class ViewAllDiagOfficersScreen extends StatefulWidget {
  @override
  _ViewAllDiagOfficersScreenState createState() => _ViewAllDiagOfficersScreenState();
}

class _ViewAllDiagOfficersScreenState extends State<ViewAllDiagOfficersScreen> {
  OfficerOneService _officerOneService = OfficerOneService();
  List<OfficerThreeModel> _officers = [];

  @override
  void initState() {
    super.initState();
    _loadOfficers();
  }

  Future<void> _loadOfficers() async {
    try {
      List<OfficerThreeModel> officers = await _officerOneService.viewAllOfficers();
      setState(() {
        _officers = officers;
      });
    } catch (e) {
      print("Failed to load officers: $e");
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('All Officers'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: _officers.length!=0? ListView.builder(
          itemCount: _officers.length,
          itemBuilder: (context, index) {
            OfficerThreeModel officer = _officers[index];
            return Card(
              child: ListTile(
                onTap: (){


                  showModalBottomSheet(context: (context), builder: (context){

                    return Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Name:"),
                              SizedBox(width: 15,),
                              Text(officer.name ?? ''),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Divider(height: 1,thickness: 1,color: Colors.green,),
                          SizedBox(height: 10,),

                          Row(
                            children: [
                              Text("Qualification:"),
                              SizedBox(width: 15,),
                              Text(officer.qualification ?? ''),
                            ],
                          ),

                          SizedBox(height: 10,),
                          Divider(height: 1,thickness: 1,color: Colors.green,),
                          SizedBox(height: 10,),

                          Row(
                            children: [
                              Text("Department:"),
                              SizedBox(width: 15,),
                              Text(officer.department ?? ''),
                            ],
                          ),

                          SizedBox(height: 10,),
                          Divider(height: 1,thickness: 1,color: Colors.green,),
                          SizedBox(height: 10,),

                          Row(
                            children: [
                              Text("Email:"),
                              SizedBox(width: 15,),
                              Text(officer.email ?? ''),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Divider(height: 1,thickness: 1,color: Colors.green,),
                          SizedBox(height: 10,),
                        ],
                      ),
                    );
                  }
                  );
                },
                leading: CircleAvatar(
                  child: Text("${index+1}"),
                ),
                title: Text(officer.name ?? ''),
                subtitle: Text(officer.email ?? ''),
                // Add more fields as needed
              ),
            );
          },
        ):Center(
          child: Text("No Data"),
        ),
      ),
    );
  }
}
