import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              leading: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
              backgroundColor: Colors.transparent,
              title: const Text("My Profile",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "amikosemi",
                      fontSize: 24,
                      fontWeight: FontWeight.normal)),
            ),
            backgroundColor: Colors.white,
            body: Stack(children: [
              Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 200,
                    ),
                    CircleAvatar(
                      radius: 41,
                      backgroundColor: Colors.teal.shade200,
                      child: const CircleAvatar(
                        backgroundImage: AssetImage("assets/profilepic.jpg"),
                        radius: 40,
                      ),
                    ),
                    const Text(
                      "Zahr_sha",
                      style: TextStyle(
                          fontFamily: "amikosemi",
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      "9012345678",
                      style: TextStyle(
                          fontFamily: "amikosemi",
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: height / 6,
                      width: width / 1.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xff0F8391),
                              Color(0xffA4ECE2),
                            ],
                          )),
                      child: const Column(
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
                                      fontFamily: "amikosemi",
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                Icon(
                                  Icons.edit,
                                  color: Colors.white,
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
                                        fontFamily: "amikosemi"),
                                  ),
                                  Icon(
                                    Icons.logout,
                                    color: Colors.white,
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