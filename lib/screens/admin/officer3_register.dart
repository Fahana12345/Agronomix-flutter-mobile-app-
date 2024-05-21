import 'package:agronomix/models/agri_offcier_modl.dart';
import 'package:agronomix/models/cheif_officer_model.dart';
import 'package:agronomix/models/diagnostic_officer_model.dart';
import 'package:agronomix/services/offcier_two_service.dart';
import 'package:agronomix/services/office_one_service.dart';
import 'package:agronomix/services/officer_three_services.dart';
import 'package:flutter/material.dart';

class Officer3Register extends StatefulWidget {
  const Officer3Register({super.key});

  @override
  State<Officer3Register> createState() => _Officer3RegisterState();
}

class _Officer3RegisterState extends State<Officer3Register> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _qualifiController = TextEditingController();
  TextEditingController _panchayathController = TextEditingController();
  TextEditingController _deptController = TextEditingController();
  TextEditingController _dobController = TextEditingController();

  bool visibile = true;
  final _regKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade100,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen.shade900,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Form(
            key: _regKey,
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Sign up",

                          style: themeData.textTheme.displayLarge,
                          textScaler: TextScaler.noScaling,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),


                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Name is mandatory";
                          }
                        },
                        controller: _nameController,
                        cursorColor: Colors.lightGreen.shade900,
                        decoration: InputDecoration(
                          // contentPadding: EdgeInsets.only(left:20,top: 25,bottom: 25),
                          hintText: "Enter Name",
                          errorStyle: TextStyle(color: Colors.orange),

                          hintStyle: themeData.textTheme.labelSmall,
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1.2,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.lightGreen.shade900,
                                width: 1.2,
                              )),

                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email is mandatory";
                          }
                        },
                        controller: _emailController,
                        cursorColor: Colors.lightGreen.shade900,
                        decoration: InputDecoration(
                          // contentPadding: EdgeInsets.only(left:20,top: 25,bottom: 25),
                          hintText: "Email",
                          errorStyle: TextStyle(color: Colors.orange),

                          hintStyle: themeData.textTheme.labelSmall,
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1.2,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.lightGreen.shade900,
                                width: 1.2,
                              )),

                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(

                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password is mandatory";
                          }
                          if (value!.length < 6) {
                            return "Passwordshould be atleast min 6 characters";
                          }

                          return null;
                        },
                        obscureText: visibile,
                        controller: _passwordController,
                        cursorColor: Colors.lightGreen.shade900,
                        decoration: InputDecoration(
                          // contentPadding: EdgeInsets.only(left:20,top: 25,bottom: 25),
                            hintText: "Password",
                            hintStyle: themeData.textTheme.labelSmall,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.lightGreen.shade900,
                                  width: 1.2,
                                )),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1.2,
                                )),
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  visibile = !visibile;
                                });
                              },
                              icon: visibile == true
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                            )),
                      ),
                      SizedBox(
                        height: 16,
                      ),


                      TextFormField(
                        controller: _dobController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Date of birth is mandatory";
                          }
                        },

                        cursorColor: Colors.lightGreen.shade900,
                        decoration: InputDecoration(
                          // contentPadding: EdgeInsets.only(left:20,top: 25,bottom: 25),
                          hintText: "DOB",
                          errorStyle: TextStyle(color: Colors.orange),

                          hintStyle: themeData.textTheme.labelSmall,
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1.2,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.lightGreen.shade900,
                                width: 1.2,
                              )),

                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _qualifiController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Qualification is mandatory";
                          }
                        },

                        cursorColor: Colors.lightGreen.shade900,
                        decoration: InputDecoration(
                          // contentPadding: EdgeInsets.only(left:20,top: 25,bottom: 25),
                          hintText: "Qualification",
                          errorStyle: TextStyle(color: Colors.orange),

                          hintStyle: themeData.textTheme.labelSmall,
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1.2,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.lightGreen.shade900,

                                width: 1.2,
                              )),

                          prefixIcon: Icon(Icons.cast_for_education),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _deptController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Department is mandatory";
                          }
                        },

                        cursorColor: Colors.lightGreen.shade900,
                        decoration: InputDecoration(
                          // contentPadding: EdgeInsets.only(left:20,top: 25,bottom: 25),
                          hintText: "Department",
                          errorStyle: TextStyle(color: Colors.orange),

                          hintStyle: themeData.textTheme.labelSmall,
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1.2,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.lightGreen.shade900,
                                width: 1.2,
                              )),

                          prefixIcon: Icon(Icons.work),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _panchayathController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Punchayath is mandatory";
                          }
                        },

                        cursorColor: Colors.lightGreen.shade900,
                        decoration: InputDecoration(
                          // contentPadding: EdgeInsets.only(left:20,top: 25,bottom: 25),
                          hintText: "Punchayath Name",
                          errorStyle: TextStyle(color: Colors.orange),

                          hintStyle: themeData.textTheme.labelSmall,
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1.2,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.lightGreen.shade900,
                                width: 1.2,
                              )),

                          prefixIcon: Icon(Icons.place),
                        ),
                      ),



                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Phone is Mandatory";
                          }
                        },

                        cursorColor: Colors.lightGreen.shade900,
                        decoration: InputDecoration(
                          // contentPadding: EdgeInsets.only(left:20,top: 25,bottom: 25),
                          hintText: "Mobile No",
                          errorStyle: TextStyle(color: Colors.orange),

                          hintStyle: themeData.textTheme.labelSmall,
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1.2,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.lightGreen.shade900,
                                width: 1.2,
                              )),

                          prefixIcon: Icon(Icons.place),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () async {
                            bool ok = _regKey.currentState!.validate();
                            if (ok) {

                              OfficerThreeModel officer=OfficerThreeModel(

                                  name: _nameController.text,
                                  email: _emailController.text,
                                  panchayath: _panchayathController.text,
                                  password: _passwordController.text,
                                  dateOfBirth: _dobController.text,
                                  phone: _phoneController.text,
                                  qualification: _qualifiController.text,
                                  department: _deptController.text,
                                  status: 1,
                                  createdAt: DateTime.now(),
                                  role: "chief"

                              );

                              OfficerThreeService _officerthreeService=OfficerThreeService();


                              bool ? res= await    _officerthreeService.signUp(officer as OfficerThreeModel);
                              if(res==true){

                                Navigator.pop(context);
                              }



                            }
                          },
                          child: Container(
                            height: 55,
                            width: 150,
                            decoration: BoxDecoration(
                                color: Colors.lightGreen,
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                                child: Text(
                                  "Register",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        ),
                      ),

                      SizedBox(height: 20,),


                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //
                      //     Text("Already have an account"),
                      //     SizedBox(width: 10,),
                      //     InkWell(
                      //
                      //         onTap: (){
                      //
                      //           Navigator.pop(context);
                      //         },
                      //
                      //         child: Text("Sign Up",style: TextStyle(color: Colors.lightGreen,fontWeight: FontWeight.w700),))
                      //   ],
                      // )
                    ],
                  ),
                ),


              ],
            )),
      ),
    );
  }
}

