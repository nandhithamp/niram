import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:niram/admin/participants_screen.dart';
import 'package:niram/admin/quiz_screen.dart';
import 'package:niram/admin/users_screen.dart';
import 'package:niram/admin/winners_list.dart';
import 'package:niram/constants/call_functions.dart';
import 'package:niram/provider/main_provider.dart';
import 'package:niram/user/login_screen.dart';
import 'package:provider/provider.dart';

import '../constants/refactoring.dart';
import 'admins_screen.dart';
import 'allcontests_screen.dart';
import 'carousel.dart';
import 'category_screen.dart';
import 'jury members_screen.dart';

class AdminHome extends StatelessWidget {
  String userName,phoneNumber,photo;
   AdminHome({super.key,required this.userName,required this.phoneNumber,required this.photo});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(children: [
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
                      "Welcome "+userName,
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

                Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return InkWell(onTap: () {
                      value.getContest();

                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AllContests()));
                    },
                        child: adminhomebtn("assets/contests.jpg", "Contests"));
                  }
                ),

                adminhomebtn(
                  "assets/winners.jpg",
                  "Winners",
                ),
                adminhomebtn(
                  "assets/shortlisted.jpg",
                  "Shortlisted",
                ),
                // adminhomebtn(
                //   "assets/quiz.jpg",
                //   "Quiz",
                // ),
                Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return InkWell(
                        onTap: () {
                          value.getCategory();
                          Navigator.push(context, MaterialPageRoute(builder:(context)=>Categories()));
                        },
                        child: adminhomebtn(
                      "assets/category.png",
                      "Category",
                    ));
                  }
                ),
                Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return InkWell(onTap: () {
                      value.getUsers();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Users()));

                    },
                      child: adminhomebtn(
                        "assets/users.png",
                        "Users",
                      ),
                    );
                  }
                ),
                adminhomebtn(
                  "assets/jury.png",
                  "Jury",
                ),

                Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return InkWell(onTap: () {
                      value.getAdmins();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Admins()));
                    },
                        child: adminhomebtn("assets/admins.png", "Admins"));
                  }
                ),
                Consumer<MainProvider>(
                    builder: (context,value,child) {
                      return InkWell(onTap: () {
                        value.clearCarousel();
                        value.getCategory();

                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Carousel()));
                      },
                        child: adminhomebtn(
                          "assets/jury.png",
                          "Carousel",
                        ),
                      );
                    }
                ),
                Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return InkWell(
                      onTap: () {
                        MainProvider mainprovider =Provider.of<MainProvider>(context,listen:false);
                        mainprovider.fetchAllParticipats();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Participants()));
                      },
                      child: adminhomebtn(
                        "assets/quiz.jpg",
                        "Participants",
                      ),
                    );
                  }
                ),
                GestureDetector(
                  onTap: () {
                    FirebaseAuth auth = FirebaseAuth.instance;
                    auth.signOut();
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
                  backgroundImage:photo==''||photo=='null'?
                  AssetImage("assets/profilepic.jpg"):NetworkImage(photo,) as ImageProvider,
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
