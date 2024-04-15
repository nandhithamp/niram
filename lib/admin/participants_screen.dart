import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:niram/admin/participants_work.dart';
import 'package:niram/constants/call_functions.dart';
import 'package:niram/provider/main_provider.dart';
import 'package:provider/provider.dart';

import '../constants/mycolors.dart';

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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Consumer<MainProvider>(builder: (context, value, child) {
                return Container(height: 50,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount:
                   value. categoriesSelectionList
                            .length,
                    itemBuilder: ((context, index) {
                      var item =
                          value.categoriesSelectionList[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: InkWell(onTap: (){
                          value.filterFun(index,item.catName,item.catID);
                        },
                          child: Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: item.selectionBool?blueDark:
                              Color(0xff0C8290),
                            ),
                            child: Center(child: Text(item.catName,style: TextStyle(color: Colors.white),)),
                          ),
                        ),
                      );
                    }),
                  ),
                );
              }),
            ),
            SizedBox(
              height: 10,
            ),
            Consumer<MainProvider>(builder: (context, value, child) {
              return SizedBox(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: value.filterParticipatesList.length,
                    itemBuilder: ((context, index) {
                      var item = value.filterParticipatesList[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Text(
                                item.customer,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "amikosemi",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Text(
                                item.category,
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: "amikosemi",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            CarouselSlider.builder(
                              itemCount: item.list.length,
                              itemBuilder: (context, index, realIndex) {
                                var item2 = item.list[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            item2,
                                          ),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                );
                              },
                              options: CarouselOptions(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  height:
                                      MediaQuery.of(context).size.height / 2.5,
                                  viewportFraction: 1,
                                  autoPlay: true,
                                  pageSnapping: true,
                                  enlargeStrategy:
                                      CenterPageEnlargeStrategy.height,
                                  enlargeCenterPage: true,
                                  autoPlayInterval: const Duration(seconds: 4),
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      caroselIndex(index);
                                    });

                                    // print("activvgvg"+Activeindex.toString());
                                  }),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Divider(
                              color: Colors.grey,
                              indent: 5,
                              endIndent: 5,
                              height: 5,
                            )
                          ],
                        ),
                      );
                    })),
              );
            })
          ],
        ),
      ),
    ));
  }
}
