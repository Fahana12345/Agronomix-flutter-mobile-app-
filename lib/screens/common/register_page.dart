import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:agronomix/screens/common/login_page.dart';

import '../../models/user_model.dart';
import '../../services/user_service.dart';
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _userController = TextEditingController();



  String? uid;

  bool visibile = true;
  bool _checked=false;
  final _regKey = GlobalKey<FormState>();
  List<String> roles = [
    'user',
    'moderator',
  ];

  String? selectedRole;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _userController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
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
                      Center(child: Text("Sign Up",style: themeData.textTheme.displayLarge,textScaler: TextScaler.noScaling,)),
                      SizedBox(height: 20,),
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

                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor:Colors.green.withOpacity(0.2),
                          // contentPadding: EdgeInsets.only(left:20,top: 25,bottom: 25),
                          hintText: "Full Name",
                          errorStyle: TextStyle(color: Colors.orange),

                          hintStyle: themeData.textTheme.labelSmall,
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),

                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: Colors.green,
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
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor:Colors.green.withOpacity(0.2),
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
                                color: Colors.green,
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
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor:Colors.green.withOpacity(0.2),
                          // contentPadding: EdgeInsets.only(left:20,top: 25,bottom: 25),
                            hintText: "Password",
                            hintStyle: themeData.textTheme.labelSmall,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.green,
                                  width: 1.2,
                                )
                            ),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1.2,
                                )
                            ),
                            prefixIcon: Icon(Icons.lock),

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

                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor:Colors.green.withOpacity(0.2),
                            // contentPadding: EdgeInsets.only(left:20,top: 25,bottom: 25),
                            hintText: "Confirm Password",
                            hintStyle: themeData.textTheme.labelSmall,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.green,
                                  width: 1.2,
                                )
                            ),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: Colors.red,
                                  width: 1.2,
                                )
                            ),
                            prefixIcon: Icon(Icons.password_outlined),
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
                        height: 25,
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: _checked,
                              onChanged: (value) {
                                setState(() {
                                  _checked = !_checked;
                                });
                              }),
                          Text("I agree the terms and Conditions")
                        ],
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () async{
                            if (_regKey.currentState!.validate()) {
                              try {
                                UserModel user = UserModel(
                                  role: "user",
                                    phone: "",
                                    name: _userController.text,
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                    createdAt: DateTime.now(),
                                    uid: uid,
                                    status: 1);

                                UserService userService = UserService();
                                final res =
                                    await userService.registerUser(user);

                                if (res == "") {
                                  Navigator.pushReplacementNamed(
                                      context, 'login');
                                }
                              } on FirebaseAuthException catch (e) {
                                // Handle FirebaseAuthException here
                                print('Firebase Auth Exception: ${e.message}');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text(
                                        "Firebase Auth Error: ${e.message}"),
                                  ),
                                );
                              } catch (e) {
                                // Catch any other type of exception
                                print('Error: $e');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text("Error: $e"),
                                  ),
                                );
                              }
                            }
                          },

                          child: Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        ),
                      ),

                      SizedBox(height: 20,),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text("Already have an account"),
                          SizedBox(width: 10,),
                          InkWell(

                              onTap: (){

                                Navigator.pop(context);
                              },

                              child: Text("Sign Up",style: TextStyle(color: Colors.green,fontWeight: FontWeight.w700),))
                        ],
                      )
                    ],
                  ),
                ),


              ],
            )),
      ),
    );
  }
}
