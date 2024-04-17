import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:niram/constants/call_functions.dart';
import 'package:niram/user/edit_profile.dart';
import 'package:niram/user/login_screen.dart';

class MyProfile extends StatelessWidget {
  String name,phone,photo;
   MyProfile({super.key,required this.name,required this.phone,required this.photo});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              leading:  IconButton(
                onPressed: (){
                  back(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.transparent,
              title:  Text("My Profile",
                  style: TextStyle(
                      color: Colors.white,


                      fontSize: 24,
                      fontWeight: FontWeight.normal)),
            ),
            backgroundColor: Colors.white,
            body: Stack(children: [
              Center(
                child: Column(
                  children: [
                     SizedBox(
                      height: 200,
                    ),
                    CircleAvatar(
                      radius: 41,
                      backgroundColor: Colors.teal.shade200,
                      child:  CircleAvatar(
                        backgroundImage:photo==''&&photo=='null'?
                        AssetImage("assets/profilepic.jpg"):NetworkImage(photo) as ImageProvider,
                        radius: 40,
                      ),
                    ),
                     Text(
                      name,
                      style: TextStyle(

                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                     Text(
                      phone,
                      style: TextStyle(

                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: height / 5.5,
                      width: width / 1.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient:  LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xff0F8391),
                              Color(0xffA4ECE2),
                            ],
                          )),
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Edit Profile",
                                  style: TextStyle(
                                      color: Color(0xffFFFFFF),

                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                IconButton(
                                  onPressed: () {
                                    callNext(context, EditProfile());
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),

                                )
                              ],
                            ),
                          ),
                          Divider(
                            indent: 25,
                            endIndent: 25,
                            color: Colors.white,
                            thickness: 2,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            child: InkWell(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Sign Out",
                                    style: TextStyle(
                                        color: Color(0xffFFFFFF),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                       ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      FirebaseAuth auth = FirebaseAuth.instance;
                                      auth.signOut();
                                      callNextReplacement(context, LoginScreen());
                                    },
                                    icon: Icon(
                                      Icons.logout,
                                      color: Colors.white,
                                    ),

                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                child: Image.asset("assets/Vector 14.png"),
              )
            ]),
            ),
        );
  }
}