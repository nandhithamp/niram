import 'package:flutter/material.dart';
import 'package:niram/provider/main_provider.dart';
import 'package:provider/provider.dart';

import '../constants/call_functions.dart';
import '../constants/refactoring.dart';
import 'add_contest.dart';

class ContestDescriptions extends StatelessWidget {
  String id;
  String photo;
  String category;
  String categoryid;
  String contest_theme;
  String age;
  String registation_fee;
  String status;
  String winning_price;
  String from_date;
  String to_date;
  String termsand_condition;

   ContestDescriptions({super.key,required this.id,required this.photo,required this.category,
    required this.categoryid,required this.contest_theme,required this.age,required this.registation_fee,
    required this.status,required this.winning_price,required this.from_date,required this.to_date,
    required this.termsand_condition});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(

        floatingActionButton: Container(
          height: height/13,
          width: width/3,
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

            },
            //backgroundColor: Colors.blueGrey,
            backgroundColor: Colors.transparent,
            child:Consumer<MainProvider>(
              builder: (context,value,child) {
                return InkWell(onTap: () {
                  print("fvmv"+id);
                  value.editcontest(id);
                  value.getContest();
                  callNext(context, AddContests(from:"EDIT", oldid:id));
                },
                    child: Text("Edit",style: TextStyle(color: Colors.white,fontFamily: "amikosemi",fontSize: 20,fontWeight: FontWeight.bold),));
              }
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),

            ),
          ),
        ),


        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: height / 2.5,
              width: width / 1,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(photo),
                      fit: BoxFit.cover)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Theme:"+contest_theme,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.only(right: 10, top: 25, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/Share_icon.png",
                          scale: 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Winning Prize",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal),
                            ),
                            Text(
                              winning_price,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: 15,
            // ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: height / 13,
                        width: width / 2.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff047E8F),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Age limit",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                              Text(
                                age,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: height / 13,
                        width: width / 2.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff047E8F),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Registration fee",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                              Text(
                                registation_fee,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: height / 13,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff047E8F),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Duration",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.normal),
                          ),
                          Text(from_date+" - "+to_date,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: height / 6,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff047E8F),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, left: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Jury",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal)),
                          Text("Jury 1",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          Text("Jury 2",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          Text("Jury 3",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Terms and Conditions",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.normal)
                  ),
                ],
              ),
            ),

            Padding(
              padding:  EdgeInsets.only(
                left: width/50,
              ),
              child: Column(
                children: [
                  Text(termsand_condition),
                  // row(width / 35, width / 1.15,
                  //   "Competitions must be completed within the stipulated time",),
                  // SizedBox(
                  //   height: height / 50,
                  // ),
                  // row(width / 35, width / 1.15,
                  //   "Draw only after you have fully understood the subject given to you.",),
                  // SizedBox(
                  //   height: height / 50,
                  // ),
                  // row(width / 35, width / 1.15,
                  //   "Try to draw the entire surface on the drawing surface",),
                  // SizedBox(
                  //   height: height / 50,
                  // ),
                  // row(width / 35, width / 1.15,
                  //   "Make sure there is no dust in the drawing.",),
                  // SizedBox(
                  //   height: height / 50,
                  // ),
                  // row(width / 35, width / 1.15,
                  //   "നിശ്ചിത സമയത്തിനുള്ളിൽ മത്സരങ്ങൾ പൂർത്തിയാക്കണം",),
                  // SizedBox(
                  //   height: height / 50,
                  // ),
                  // row(width / 35, width / 1.15,
                  //   "നിങ്ങൾക്കു തന്നിരിക്കുന്ന വിഷയം പൂർണമായും മനസ്സിലാക്കിയതിനു ശേഷം മാത്രം വരക്കുക",),
                  // SizedBox(
                  //   height: height / 50,
                  // ),
                  // row(width / 35, width / 1.15,
                  //   " വരക്കുന്ന പ്രതലത്തിൽ മുഴുവനായി വരയ്ക്കാൻ ശ്രമിക്കുക",),
                  // SizedBox(
                  //   height: height / 50,
                  // ),
                  // row(width / 35, width / 1.15,
                  //   "വരക്കുന്ന ചിത്രത്തിൽ പൊടിയോ മറ്റോ ആകാതിരിക്കാൻ ശ്രദ്ധിക്കുക.",),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}