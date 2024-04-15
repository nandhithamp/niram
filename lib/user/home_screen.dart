import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:niram/constants/call_functions.dart';
import 'package:niram/provider/main_provider.dart';
import 'package:niram/user/contest_screen.dart';
import 'package:niram/user/my_profile.dart';
import 'package:niram/user/shortlisted_screen.dart';
import 'package:niram/user/winners_screen.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  String name,phone,photo,id;
    HomeScreen({super.key,required this.name,required this.photo,required this.phone ,required this.id });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
int Activeindex = 0;

void caroselIndex(int index) {
  Activeindex = index;
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    var images = [
      'assets/thinkhappy.jpg',
      "assets/happiness.jpg",
      "assets/canoe.jpg",
      'assets/oil_painting.jpg',
      'assets/mom.jpg'
    ];

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    List<String> itemimages = ["assets/happiness.jpg", "assets/happiness.jpg"];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          toolbarHeight: 80,
          title: ShaderMask(
            shaderCallback: (bounds) =>
                LinearGradient(colors: [Color(0xff088090), Color(0xff7EB5AB)])
                    .createShader(bounds),
            child: Text(
              "Welcome "+widget.name+',',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
          actions: [
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Stack(children: [
                  GestureDetector(
                    onTap: (){
                      callNext(context, MyProfile(name: widget.name,phone: widget.phone,photo: widget.photo,));
                    },
                    child: CircleAvatar(
                      radius: 31,
                      backgroundColor: Colors.teal.shade200,
                      child:widget.photo==''&&widget.photo=='null'?
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/profilepic.jpg"),
                        radius: 30,
                      ):   CircleAvatar(
                        backgroundImage: NetworkImage(widget.photo),
                        radius: 30,
                      ),
                    ),
                  ),
                  Positioned(
                      left: 40,
                      child: CircleAvatar(
                        backgroundColor: Color(0xff088090),
                        radius: 5,
                      ))
                ])
              ],
            ),
            SizedBox(
              width: width / 25,
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child:
          Column(
              crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 23),
              child: Text(
                "Recent Contests",
                style: TextStyle(
                  color: Colors.grey.shade700,
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 230,
              child: Consumer<MainProvider>(
                builder: (context,value,child) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: value.carouselList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 225,
                          width: 395,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(blurRadius: 3, color: Colors.grey)
                              ],
                              image: DecorationImage(
                                  image: NetworkImage(value.carouselList[index].carousel_photo),
                                  fit: BoxFit.cover)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                value.carouselList[index].category_name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "Theme: "+value.carouselList[index].contest_theme,
                                style: TextStyle(
                                  fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 23),
              child: Text(
                "Categories",
                style: TextStyle(
                    fontSize: 18,
                    color:  Colors.grey.shade700,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return GestureDetector(
                      onTap: (){
                        value.getContest();
                        callNext(context, ContestScreen(customerID: widget.id,customerPhone: widget.phone,
                            customerName: widget.name,));
                      },
                      child: Container(
                        height: 63,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            border: Border.all(color: Color(0xff088090))),
                        child: Row(
                          children: [
                            CircleAvatar(
                                backgroundImage: AssetImage("assets/contests.jpg")),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Contests",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                ),
                GestureDetector(
                  onTap: (){
                    callNext(context, WinnersScreen());
                  },
                  child: Container(
                      height: 63,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(color: Color(0xff088090))),
                      child: Row(
                        children: [
                          CircleAvatar(
                              backgroundImage: AssetImage("assets/winners.jpg")),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Winners",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          )
                        ],
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (){
                    callNext(context, ShortlistedScreen());
                  },
                  child: Container(
                      height: 63,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(color: Color(0xff088090))),
                      child: Row(
                        children: [
                          CircleAvatar(
                              backgroundImage:
                              AssetImage("assets/shortlisted.jpg")),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Short listed",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          )
                        ],
                      )),
                ),
                GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                      height: 63,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          border: Border.all(color: Color(0xff088090))),
                      child: Row(
                        children: [
                          CircleAvatar(
                              backgroundImage: AssetImage("assets/quiz.jpg")),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Quiz",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          )
                        ],
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder: (context, index, realIndex) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height:150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(image: AssetImage(images[index]),fit: BoxFit.cover)
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
                  }),
            ),

            buildIndiCator(images.length, context, Activeindex),
            // Text("data")
          ]),
        ),
      ),
    );
  }
}
buildIndiCator(int count, BuildContext context, int activeindex) {
  return Center(
      child: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: AnimatedSmoothIndicator(
            activeIndex: activeindex,
            count: count,
            effect: const JumpingDotEffect(
                dotWidth: 7,
                dotHeight: 7,
                strokeWidth: 1,
                paintStyle: PaintingStyle.stroke,
                activeDotColor: Color(0xff0C8290),
                dotColor: Colors.teal),
          ),
          ),
      );
}