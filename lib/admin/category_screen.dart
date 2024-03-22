import 'dart:ui';

import 'package:flutter/material.dart';


class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final Shader linearGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[Color(0xff0C8290), Color(0xffBFAB78)],
    ).createShader(Rect.fromLTWH(10, 40, 100.0, 30.0));
    List<String> texts = [
      "Pencil Drawing",
      "Oil Painting",
      "Digital Painting",
      "Water Coloring",
      "Photography",
      "Videography",
      "Poem Writing",
      "Story Writing"
    ];

    return SafeArea(
        child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              leading: Icon(
                Icons.arrow_back_outlined,
                color: Color(0xff0C8290),
                size: 25,
              ),
              title: Text("Categories",
                  style: TextStyle(
                      fontFamily: "amikosemi",
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()..shader = linearGradient)),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Container(
              height: 60,
              width: 215,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff248C96),
                      Color(0xffA7CCC4),
                    ],

                  )
              ),
              child: FloatingActionButton(
                onPressed: () {
                  showDialog(
                    context: context,

                    builder: (BuildContext context) {
                      return BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10,sigmaY: 10),
                        // filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Center(
                          child: SingleChildScrollView(
                            child: AlertDialog(
                                backgroundColor:Color(0xffD9D9D9).withOpacity(0.85),
                                actions: <Widget>[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: height /9,
                                    child: Column(
                                      children: [

                                        TextFormField(
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                              fillColor: Colors.white,
                                              filled: true,
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(15),
                                              ),
                                              hintText: "Category Name",
                                              hintStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontFamily: "amikosemi",
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                        ),

                                      ],
                                    ),


                                  ),

                                  Center(
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Container(
                                        height: height / 12,
                                        width: width / 2.5,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30),
                                            gradient: const LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color(0xff248C96),
                                                Color(0xffA7CCC4),
                                              ],
                                            )),
                                        child: Center(
                                            child: Text(
                                              "Add",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "amikosemi",
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                      ),
                                    ),
                                  )
                                ]),
                          ),
                        ),
                      );
                    },);

                },
                //backgroundColor: Colors.blueGrey,
                backgroundColor: Colors.transparent,
                child: Text("Add Category",style: TextStyle(color: Colors.white,fontFamily: "amikosemi",fontSize: 20,fontWeight: FontWeight.bold),),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),

                ),
              ),
            ),


            // floatingActionButton: FloatingActionButton(
            //   child: Container(
            //     width: 215,
            //     height: 60,
            //     child: Text("Add Category"),
            //     decoration: BoxDecoration(
            //         // shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            //         borderRadius: BorderRadius.circular(15),
            //         gradient:
            //             LinearGradient(colors: [
            //               Color(0xff248C96),
            //               Color(0xffA7CCC4),
            //                ]
            //                )
            //                ),
            //   ),
            //   onPressed: () {},
            // ),
            backgroundColor: Colors.white,
            body:
            // Divider(color: Colors.black,thickness: 3,height: 10,indent: 10,endIndent: 10,)),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: texts.length,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 5),
                            child: Container(
                              height: 57,
                              width: 364,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xff047E8F)),
                              child: Center(
                                  child: Text(
                                    texts[index],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "amikosemi",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                                  )),
                            ),
                          );
                        })),
                  ),
                ],
              ),
            )));
  }
}