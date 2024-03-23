import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:niram/constants/call_functions.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              back(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
              size: 24,
            ),
          ),
          backgroundColor: Colors.transparent,
          title: const Text(
            "Edit Profile",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Stack(children: [
          Image.asset("assets/Vector 14.png"),
          Positioned(
            //child:
            child: SingleChildScrollView(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  Stack(children: [
                    Material(
                      shape: CircleBorder(),
                      borderOnForeground: false,
                      elevation: 10,
                      child: CircleAvatar(
                        radius: 51,
                        backgroundColor: Colors.teal.shade200,
                        child: CircleAvatar(
                          backgroundImage: AssetImage("assets/profilepic.jpg"),
                          radius: 50,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 1,
                      left: 68,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff047E8F)),
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          child: Icon(Icons.edit_outlined, size: 15),
                          radius: 13,
                          backgroundColor: Colors.white,
                        ),
                      ),
                    )
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Name",
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                  ),
                                  isDense: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Phone Number",
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  isDense: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15))),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Age",
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      ),
                                  isDense: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15))),
                            ),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: "Place",
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                 ),
                                isDense: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15))),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      back(context);
                    },
                    child: Container(
                      height: height / 13,
                      width: width / 2.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xff0996A9),
                              Color(0xff3D9698),
                            ],
                          )),
                      child: const Center(
                          child: Text(
                        "Update",
                        style: TextStyle(

                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      )),
                    ),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
