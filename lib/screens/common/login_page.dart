import 'package:flutter/material.dart';
import 'package:agronomix/screens/common/register_page.dart';

import '../../services/auth_service.dart';
import '../forgotpassword_page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();


  bool visible=true;
  final _loginKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final themeData=Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),

      ),

      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Form(
            key: _loginKey,
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Center(child: Text("Login",style: themeData.textTheme.displayLarge,textScaler: TextScaler.noScaling,)),
                      SizedBox(height: 50,),


                      TextFormField(

                        controller: _emailController,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor:Colors.green.withOpacity(0.2),
                          //contentPadding: EdgeInsets.only(left: 20,top: 25,bottom: 25),
                          hintText: "Enter Email",


                          hintStyle: themeData.textTheme.labelSmall,
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),

                              borderSide: BorderSide(
                                color: Colors.red,
                                width: 1.2,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color:Colors.black,
                                width: 1.3,

                              )
                          ),

                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                  color: Colors.green,
                                  width: 1.3,
                              )
                          ),
                          prefixIcon: Icon(Icons.email),

                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        validator:(value){
                          if(value!.isEmpty){
                            return"Password is mandatory";
                          }
                          if(value!.isEmpty){
                            return"Password be atleast min 6 characters";
                          }
                          return null;
                        },
                        obscureText: visible,
                        controller: _passwordController,
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor:Colors.green.withOpacity(0.2),
                          //contentPadding: EdgeInsets.only(left: 20,top: 25,bottom: 25),
                            hintText: "Enter Password",


                            hintStyle: themeData.textTheme.labelSmall,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                            color:Colors.black,
                                  width: 1.3,

                        )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                    color: Colors.green,
                                    width: 1.2
                                )
                            ),
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              onPressed: (){
                                setState(() {
                                  visible=!visible;
                                });
                              },icon: visible==true? Icon(Icons.visibility_off):Icon(Icons.visibility),)


                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Forgot Password?"),
                          SizedBox(width: 10,),
                          InkWell(

                            onTap: (){

                              Navigator.push(context,MaterialPageRoute(builder: (context)=>Forgotpassword()));
                            },
                             child: Text("Click Here",style: TextStyle(color: Colors.green,fontWeight: FontWeight.w700)),
                          )

                        ],
                      ),
                      SizedBox(
                        height: 55,
                        width:250,

                      ),
                      Center(
                        child: GestureDetector(
                          onTap: ()async {
                            if (_loginKey.currentState!.validate()) {
                              AuthService _authService = AuthService();

                              final userData = await _authService.loginUser(
                                  _emailController.text.trim(), _passwordController.text.trim());
                              print(userData);
                              if (userData != null) {
                                if (userData['role'] == 'user') {
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    'bottomnavigation',
                                        (route) => false,
                                  );

                                }else if(userData['role']=='admin'){

                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    'adminhome',
                                        (route) => false,
                                  );
                                }else if(userData['role']=='diagnostic'){

                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    'officer1home',
                                        (route) => false,
                                  );
                                }
                                else if(userData['role']=='agriculture'){

                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    'officer2home',
                                        (route) => false,
                                  );
                                }


                                else if(userData['role']=='chief'){

                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    'officer3home',
                                        (route) => false,
                                  );
                                }
                              }
                            }

                          },
                          child: Container(
                            height: 55,
                            width: 250,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text("Dont have an account"),
                          SizedBox(width: 10,),
                          InkWell(

                              onTap: (){

                                Navigator.push(context,MaterialPageRoute(builder: (context)=>RegisterPage()));
                              },

                              child: Text("Register",style: TextStyle(color: Colors.green,fontWeight: FontWeight.w700),))
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            )),
      ),
    );

  }
}
