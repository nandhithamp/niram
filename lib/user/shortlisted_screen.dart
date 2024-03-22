import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:niram/constants/refactoring.dart';

class ShortlistedScreen extends StatelessWidget {
  const ShortlistedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Icon(Icons.arrow_back_ios,color: Colors.white,size: 24,),
          title: Text("Shortlisted",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w500),),
        ),
        extendBodyBehindAppBar: true,
        body: Stack(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height / 10,
                ),
                SizedBox(
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    // scrollDirection:  Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hiba",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            IntrinsicHeight(
                              child: Row(
                                children: [
                                  Text('Oil Painting',style: TextStyle(color: Colors.grey.shade600,fontSize: 18),),

                                  VerticalDivider(
                                    color: Colors.grey.shade900,
                                    thickness: 0.5,endIndent: 3,indent: 3
                                  ),
                                  Text('Travel',style: TextStyle(color: Colors.grey.shade600,fontSize: 18),),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height/80,
                            ),
                            GestureDetector(
                              onTap: (){
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
                              child: Container(
                                height: 325,
                                width: 367,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 4,
                                          offset: Offset(0, 4))
                                    ],
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/nature phtography.jpg"),
                                        fit: BoxFit.cover),
                                    color: Colors.teal),
                              ),
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
        ]),
      ),
    );
  }
}
