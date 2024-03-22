import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:niram/constant/colors.dart';

class JuryMembers extends StatelessWidget {
  const JuryMembers({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final Shader linearGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[Color(0xff0C8290), Color(0xffBFAB78)],
    ).createShader(Rect.fromLTWH(10, 40, 100.0, 30.0));

    List<String> jury_name = ["Name", "Name", "Name", "Name"];
    List<String> jury_destination = [
      "Destination",
      "Destination",
      "Destination",
      "Destination"
    ];
    // List<String> jury_phone=["phone","phone","phone","phone",];
    // List<String> jury_place=["place","place","place","place",];
    List<String> images = [
      "assets/person1.png",
      "assets/person2.png",
      "assets/person3.png",
      "assets/person4.png"
    ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.arrow_back_outlined,
            color: Color(0xff0C8290),
          ),
          title: Text("jury Members",
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
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff248C96),
                  Color(0xffA7CCC4),
                ],
              )),
          child: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,

                builder: (BuildContext context) {
                  return BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Center(
                      child: SingleChildScrollView(
                        child: AlertDialog(
                            backgroundColor:Color(0xffD9D9D9).withOpacity(0.85),
                            actions: <Widget>[
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: height /3 ,
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                        backgroundColor: Colors.white,radius: 40,

                                        child: Icon(Icons.add_photo_alternate_outlined,size: 35,color: Colors.grey,)
                                    ),
                                    SizedBox(height: 5,),
                                    TextFormField(

                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          hintText: "Name",
                                          hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: "amikosemi",
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    SizedBox(height: 10,),
                                    TextFormField(
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          hintText: "Designation",
                                          hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontFamily: "amikosemi",
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),


                              ),
                              SizedBox(
                                height: 15,
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
                                        )
                                    ),
                                  ),
                                ),
                              )
                            ]),
                      ),
                    ),
                  );
                },
              );
            },
            //backgroundColor: Colors.blueGrey,
            backgroundColor: Colors.transparent,
            child: Text(
              "Add Jury Member",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "amikosemi",
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(height: height/1.2,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: jury_name.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                            height: 131,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xff047E8F),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(images[index]),
                                    radius: 50,
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: width / 2.8,
                                        ),
                                        Image.asset(
                                          "assets/edit.png",
                                          scale: 20,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Image.asset(
                                          "assets/delete.png",
                                          scale: 20,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      jury_name[index],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      jury_destination[index],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: height / 20,
                                    ),
                                  ],
                                ),
                                SizedBox(),
                              ],
                            )),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
//  Row(mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         SizedBox(width: 100,),
//                                         Image.asset("assets/edit.png",scale: 20,),
//                                         SizedBox(width: 8,),
//                                         Image.asset("assets/delete.png",scale: 20,),

//                                       ],
//                                     ),