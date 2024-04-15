import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:niram/admin/participants_work.dart';
import 'package:niram/constants/call_functions.dart';
import 'package:niram/provider/main_provider.dart';
import 'package:provider/provider.dart';

class Participants extends StatefulWidget {
   Participants({super.key});

  @override
  State<Participants> createState() => _ParticipantsState();
}

class _ParticipantsState extends State<Participants> {
  final Shader linearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[Color(0xff0C8290), Color(0xffBFAB78)],
  ).createShader(Rect.fromLTWH(10, 40, 100.0, 30.0));

  List<String> names = ["Hiba", "Athulya"];

  List<String> category = ["Oil painting", "Story"];

  List<String> works = ["assets/travel.jpg", "assets/story.jpg"];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Color(0xff0C8290),
              size: 25,
            ),

            centerTitle: true,
            title: Text("Participants",
                style: TextStyle(
                    fontFamily: "amikosemi",
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()..shader = linearGradient)),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                  child: Container(
                    height: height / 12,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff0C8290),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Select Contest",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: "amikosemi",
                              fontWeight: FontWeight.normal),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return SizedBox(
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: value.ParticipatesList.length,
                          itemBuilder: ((context, index) {
                            var item=value.ParticipatesList[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15,right: 15),
                                    child: Text(item.customer,style: TextStyle(color: Colors.black,fontFamily: "amikosemi",fontSize: 20,fontWeight: FontWeight.bold),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15,right: 15),
                                    child: Text(item.category,style: TextStyle(color: Colors.grey,fontFamily: "amikosemi",fontSize: 18,fontWeight: FontWeight.bold),),
                                  ),
                                  CarouselSlider.builder(
                                    itemCount: item.list.length,
                                    itemBuilder: (context, index, realIndex) {
                                      var item2=item.list[index];
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(image: NetworkImage(item2,),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.circular(15),
                                          ),

                                        ),
                                      );
                                    },
                                    options: CarouselOptions(
                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                        height: MediaQuery.of(context).size.height / 2.5,
                                        viewportFraction: 1,
                                        autoPlay: true,
                                        pageSnapping: true,
                                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                                        enlargeCenterPage: true,
                                        autoPlayInterval: const Duration(seconds: 4),
                                        onPageChanged: (index, reason) {
                                          setState(() {
                                            caroselIndex(index);
                                          });

                                          // print("activvgvg"+Activeindex.toString());
                                        }),
                                  ),
                                  SizedBox(height: 8,),
                                  Divider(color: Colors.grey,indent: 5,endIndent: 5,height: 5,)
                                ],
                              ),
                            );
                          })),
                    );
                  }
                )
              ],
            ),
          ),
        ));
  }
}