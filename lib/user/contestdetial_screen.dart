import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:niram/constants/call_functions.dart';
import 'package:niram/constants/refactoring.dart';
import 'package:niram/user/upload_screen.dart';

class ContestDetials extends StatelessWidget {
  const ContestDetials({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/background.jpg"),
          fit: BoxFit.cover,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: height / 2.8,
                  width: width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/oil_painting.jpg"),
                          fit: BoxFit.cover)),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        // SizedBox(height: height/50,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Oil Painting",style: TextStyle(color: Colors.white,fontSize: 24),),
                                Text("Theme: Travel ",style: TextStyle(color: Colors.white,fontSize: 24),),],),
                           Image.asset("assets/Share_icon.png",scale: 4.5,)
                          ],
                        ),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(width: width/10,),
                            Column(crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text("Winning Prize",style: TextStyle(color: Colors.white,fontSize: 24),),
                                Text("7000",style: TextStyle(color: Colors.white,fontSize: 24),),],),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15, left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          container(
                              height / 14, width / 2.2, "Age limit", "15-20"),
                          SizedBox(
                            width: width / 30,
                          ),
                          container(height / 14, width / 2.2,
                              "Registration fee", "20"),
                        ],
                      ),
                      SizedBox(
                        height: height / 50,
                      ),
                      container(height / 14, width, "Duration",
                          "27-01-2024  -  10-02-2024"),
                      SizedBox(
                        height: height / 50,
                      ),
                      Text(
                        "Terms and Conditions",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: height / 100,
                      ),
                      Padding(
                        padding:  EdgeInsets.only(
                          left: width/50,
                        ),
                        child: Column(
                          children: [
                            row(width / 35, width / 1.15,
                                "Competitions must be completed within the stipulated time",),
                            SizedBox(
                              height: height / 50,
                            ),
                            row(width / 35, width / 1.15,
                                "Draw only after you have fully understood the subject given to you.",),
                            SizedBox(
                              height: height / 50,
                            ),
                            row(width / 35, width / 1.15,
                                "Try to draw the entire surface on the drawing surface",),
                            SizedBox(
                              height: height / 50,
                            ),
                            row(width / 35, width / 1.15,
                                "Make sure there is no dust in the drawing.",),
                            SizedBox(
                              height: height / 50,
                            ),
                            row(width / 35, width / 1.15,
                                "നിശ്ചിത സമയത്തിനുള്ളിൽ മത്സരങ്ങൾ പൂർത്തിയാക്കണം",),
                            SizedBox(
                              height: height / 50,
                            ),
                            row(width / 35, width / 1.15,
                                "നിങ്ങൾക്കു തന്നിരിക്കുന്ന വിഷയം പൂർണമായും മനസ്സിലാക്കിയതിനു ശേഷം മാത്രം വരക്കുക",),
                            SizedBox(
                              height: height / 50,
                            ),
                            row(width / 35, width / 1.15,
                                " വരക്കുന്ന പ്രതലത്തിൽ മുഴുവനായി വരയ്ക്കാൻ ശ്രമിക്കുക",),
                            SizedBox(
                              height: height / 50,
                            ),
                            row(width / 35, width / 1.15,
                                "വരക്കുന്ന ചിത്രത്തിൽ പൊടിയോ മറ്റോ ആകാതിരിക്കാൻ ശ്രദ്ധിക്കുക.",),
                          ],
                        ),
                      ),
                      SizedBox(
                       height: height/20,
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: width / 10,
                          ),
                          GestureDetector(
                            onTap: (){
                              callNext(context, UploadScreen());
                            },
                            child: Container(
                              height: height / 20,
                              width: width / 2.3,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xff1A8894),
                                      Color(0xff79B3AA),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 3,
                                        color: Colors.grey,
                                        offset: Offset(0, 3))
                                  ]),
                              child: Center(
                                child: Text(
                                  "Participate",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height/20,
                ),
              ],
            ),

          ),
        ),
      ),
    );
  }
}
