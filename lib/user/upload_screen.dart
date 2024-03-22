import 'package:flutter/material.dart';

class UploadYourwork extends StatefulWidget {
  const UploadYourwork({super.key});

  @override
  State<UploadYourwork> createState() => _UploadYourworkState();
}

class _UploadYourworkState extends State<UploadYourwork> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Stack(children: [
                Column(
                  children: [Image.asset("assets/uploadwork_vector.png")],
                ),
                Positioned(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, right: 31),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 52,
                          ),
                          Text(
                            "Upload your work",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'amikosemi',
                                fontSize: 24,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Add three images of your work",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "amikosemi",
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 217,
                            width: 369,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.circular(15),
                                border: Border.all(color: Colors.black),
                                // Icon(Icons.access_alarm),
                                color: Colors.transparent),
                            child: Image.asset(
                              "assets/image_Vector.png",
                              scale: 15,
                            ),
                          ),
                          SizedBox(
                            height: 13,
                          ),
                          Container(
                            height: 217,
                            width: 369,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.circular(15),
                                border: Border.all(color: Colors.black),
                                // Icon(Icons.access_alarm),
                                color: Colors.transparent),
                            child: Image.asset(
                              "assets/image_Vector.png",
                              scale: 15,
                            ),
                          ),
                          SizedBox(
                            height: 13,
                          ),
                          Container(
                            height: 217,
                            width: 369,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.circular(15),
                                border: Border.all(color: Colors.black),
                                // Icon(Icons.access_alarm),
                                color: Colors.transparent),
                            child: Image.asset(
                              "assets/image_Vector.png",
                              scale: 15,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: Container(
                              height: 49,
                              width: 230,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        // Color.fromARGB(255, 132, 163, 165),
                                        Color(0xff3D9698),
                                        Color(0xff0996A9),
                                        // Color(0xff8CA3A1)

                                      ])
                                // color: Colors.amber
                              ),
                              child: Center(
                                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Upload",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Icon(Icons.upload_outlined,color: Colors.white,)
                                    ],
                                  )),
                            ),
                          )
                        ],
                      ),
                    ))
              ]),
            ),
            ),
        );
    }
}