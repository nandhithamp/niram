
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:niram/provider/main_provider.dart';
import 'package:niram/user/drawing_contest.dart';
import 'package:niram/user/photography_contest.dart';
import 'package:niram/user/shortlisted_screen.dart';
import 'package:niram/user/writig_contest.dart';
import 'package:provider/provider.dart';

import '../constants/refactoring.dart';

class ContestScreen extends StatefulWidget {
  const ContestScreen({super.key});

  @override
  State<ContestScreen> createState() => _ContestScreenState();
}

class _ContestScreenState extends State<ContestScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  PageController pageView = PageController(initialPage: 0, );
  // int currentIndex = 0;
  int selectedIndex = 0;


  @override
  void initState() {
    controller = TabController(length:4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var provider = Provider.of<MainProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var names=[
      "Drawing",
      "Photography",
      "Writing",
    ];
    var subNames=[
      "All",
      "Upcoming",
      "Ongoing",
      "Closed"
    ];

    return SafeArea(
      child: Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Icon(Icons.arrow_back_ios,color: Colors.white,),

          title: Text("Contests", style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight:  FontWeight.w600),),

        ),

        extendBodyBehindAppBar: true,
        body:
        Stack(
          children: [
           
            SingleChildScrollView(
              child: Column(
              children: [
                SizedBox(
                  height: height / 4.8,
                ),
                SizedBox(
                  height: 60,
                  child: ListView.builder(

                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: names.length,
                    itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>ShortlistedScreen() ,));
                        },
                        child: contestcategory(names[index]));


                  },),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("All"),
                      Text("Upcoming"),
                      Text("Ongoing"),
                      Text("Closed"),
                    ],
                  ),
                ),
                ListView.builder(padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10,top: 15),
                      child: Container(
                        height: height/4,
                        width:width/1.1 ,
                        decoration:  BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 3,
                              color: Colors.grey,
                              offset: Offset(0, 3)
                            )
                          ],
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(image: AssetImage("assets/nature phtography.jpg"),fit: BoxFit.cover)
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: height/100,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10,),
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(width: width/20,),
                                  Text("Ongoing",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w800),),

                                ],
                              ),
                            ),
                            SizedBox(height: height/28,),

                            Text("Digital Painting",style: TextStyle(color: Colors.white,fontSize: 20),),

                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Theme : ",style: TextStyle(color: Colors.white,fontSize: 20)),
                                Text("Nature",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
                              ],
                            ),

                          ],
                        ),
                      ),
                    );

                },)
              ],),
            ),
            Image.asset("assets/Vector 14.png",),

          ],
        ),
      ),
    );
  }
}
