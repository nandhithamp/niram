import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/refactoring.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Container(
            width: width,
            height: height / 2.8,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/newone.png"),
                fit: BoxFit.cover,
              ),
            ),
              child: Column(
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
              Column(
                children: [
                  textGradient("      Welcome\nGlad to see you!"),
                  SizedBox(height: height / 18),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade500,
                              offset: Offset(0, 2),
                              blurRadius: 2)
                        ],
                        borderRadius: BorderRadius.circular(15)
                    ),
                    height:height / 15,
                    width: width / 1.15,

                    child: TextFormField(inputFormatters: [LengthLimitingTextInputFormatter(10)],
                      
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        
                          hintText: "  Phone Number",
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                          border: InputBorder.none),
                    ),
                  ),

                  SizedBox(height: height / 30),
                  Container(
                    height: 57,
                    width: 147,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2,
                          color: Colors.grey,
                          offset: Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff3D9698).withOpacity(0.5),
                          Color(0xff0996A9).withOpacity(0.6),
                        ],
                      ),
                    ),
                    child: Tab(
                      icon: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          
              Container(
                width: width,
                height: height / 3.58,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Vector 4.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: height / 7),
                    Row(
                      children: [
                        SizedBox(width: width / 6),
                        Text(
                          "Don’t have an account?  ",
                          style: TextStyle(fontSize: 15, color: Color(0xff047E8F)),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Sign Up Now",
                            style: TextStyle(fontSize: 15, color: Color(0xff785E19)),
                          ),
                        ),
                      ],
                    ),
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
