import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WinnersScreen extends StatelessWidget {
  const WinnersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(

          backgroundColor: Colors.transparent,

          leading: Icon(Icons.arrow_back_ios,color: Colors.white,),
          title: Text(
            "Winners",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),

        ),
        extendBodyBehindAppBar: true,

        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: height/7,
                  ),
                  Container(
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (_) => BackdropFilter(
                                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                      child: AlertDialog(
                                        backgroundColor: Colors.white24,
                                        contentPadding: EdgeInsets.zero,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0))),
                                        content: Container(
                                          width: 360,
                                          height: 460,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              image: DecorationImage(image: AssetImage("assets/nature phtography.jpg"),fit: BoxFit.cover)

                                          ),



                                        ),

                                      ),
                                    ));
                              },
                              child: SizedBox(height: 230,
                                child: Stack(children: [
                                  Container(
                                    height: 208,
                                    width: 190,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black12,
                                              blurRadius: 3,
                                              offset: Offset(0, 3))
                                        ],
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            image:
                                                AssetImage("assets/nature phtography.jpg"),
                                            fit: BoxFit.cover),
                                        color: Colors.teal),
                                  ),
                                  Positioned(
                                    top: width/2,
                                    child: Container(
                                      width: 70,
                                      height: 18,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                        color: Colors.black38,
              
                                      ),
                                      child: Center(child: Text("click here",style: TextStyle(fontSize: 7,color: Colors.white),)),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                            SizedBox(
                              width: width / 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "assets/medal 1.png",
                                  scale: 5,
                                ),
                                SizedBox(
                                  height: height / 80,
                                ),
                                Text(
                                  "Shameem",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),
                                Text(
                                  "photography",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                Text(
                                  "Theme : Nature",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                              ),
                  ),
                ],
              ),
            ),
            Image.asset('assets/Vector 14.png'),
          ]
        ),
      ),
    );
  }
}
