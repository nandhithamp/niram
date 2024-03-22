import 'package:flutter/material.dart';

import '../constants/refactoring.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(width: width,
                height: height / 4.5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/Vector 6 (5).png"),
                        fit: BoxFit.cover)),
                child:Column(
                  children: [
                    SizedBox(height: height/80,),
                    Padding(
                      padding:  EdgeInsets.only(right: width/30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(height: height/20,),
                          CircleAvatar(
                            radius: 21,
                            backgroundColor: Colors.teal.shade200,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage("assets/niram_logo.jpg"),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
      
              ),
              Center(
                child: Column(
                  children: [
                    textGradient( "   Create Account \nto get started now!,"),
                    SizedBox(
                      height: height / 30,
                    ),
                    RegisterField(height / 18, width / 1.15, "  Name"),
                    SizedBox(
                      height: height / 80,
                    ),
                    RegisterField1(height / 18, width / 1.15, "  Phone Number",10),


                    SizedBox(
                      height: height / 80,
                    ),
                    RegisterField1(height / 18, width / 1.15, "  Age",2),
                    SizedBox(
                      height: height / 80,
                    ),
                    RegisterField(height / 18, width / 1.15, "  Place"),
                    SizedBox(
                      height: height / 30,
                    ),
                    Container(
                      height: 57,
                      width: 147,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 2,
                                color: Colors.grey,
                                offset: Offset(0, 3)),
                          ],
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xff3D9698).withOpacity(0.5),
                                Color(0xff0996A9).withOpacity(0.6)
                              ])),
                      child: Tab(
                          icon: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height/15,
              ),
              Container(width: width,
                height: height / 5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/Vector 6 (6).png"),
                        fit: BoxFit.cover)),
                child: Row(
                  children: [
                    SizedBox(width: width/6,),
                    Text("Already have an account?",style: TextStyle(fontSize: 15,color: Color(0xff047E8F)),),
                    GestureDetector(onTap: (){},
                        child: Text("Login Now",style: TextStyle(fontSize: 15,color: Color(0xff785E19)))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
