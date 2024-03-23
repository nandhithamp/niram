import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:niram/admin/participants_screen.dart';
import 'package:niram/admin/quiz_screen.dart';
import 'package:niram/admin/users_screen.dart';
import 'package:niram/admin/winners_list.dart';
import 'package:niram/constants/call_functions.dart';
import 'package:niram/user/login_screen.dart';

import 'admins_screen.dart';
import 'allcontests_screen.dart';
import 'category_screen.dart';
import 'jury members_screen.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> logo = [
      "assets/contests.jpg",
      "assets/winners.jpg",
      "assets/shortlisted.jpg",
      "assets/quiz.jpg",
      "assets/category.png",
      "assets/users.png",
      "assets/jury.png",
      "assets/admins.png"
    ];
    List<String> logoname=[
      "Contests",
      "Winners",
      "Shortlisted",
      "Quiz",
      "Category",
      "Users",
      "Jury",
      "Admins"

    ];
    var pages=[
      AllContests(),
      WinnersList(),
      Participants(),
      Quiz(),
      Categories(),
      Users(),
      JuryMembers(),
      Admins(),
    ];
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children:[
              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                  height: height / 5.5,
                  width: width,
                  color: Color(0xff047E8F),
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, left: 20),
                    child: Text(
                      "Welcome Hari,",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'alef',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 500,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                      itemCount: logo.length,
                      shrinkWrap: true,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 5),
                          child: GestureDetector(
                            onTap: (){
                              callNext(context, pages[index]);

                            },
                            child: Container(
                              height: 50,
                              width: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Color(0xff047E8F)),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 50,
                                      width: 50,


                                      decoration: BoxDecoration(
                                        color: Colors.teal,
                                          shape: BoxShape.circle,
                                      ),
                                      child: Container(
                                                                    height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,

                                          image: DecorationImage(image: AssetImage(logo[index]))
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(logoname[index],style: TextStyle(fontSize: 16,fontWeight: FontWeight.w200,fontFamily: "amikosemi"),),
                                ],

                              ),
                            ),
                          ),
                        );
                      })),
                ),

                GestureDetector(
                  onTap: (){
                    callNextReplacement(context, LoginScreen());

                  },
                  child: Center(
                    child: Container(
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
                          "Logout",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
              Positioned(
                top: 40,
                right: 15,
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Color(0xff047E8F),
                  child: CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage("assets/profilepic.jpg"),
                  ),
                ),
              )

            ]
          ),
        ),
      ),
    );
  }
}

