import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
      'assets/thinkhappy.png',
      "assets/happiness.jpg",
      "assets/canoe.png",
      'assets/oilpainting.png',
      'assets/mom.png'
    ];

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    List<String> itemimages = ["assets/happiness.jpg", "assets/happiness.jpg"];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 80,
          title: ShaderMask(
            shaderCallback: (bounds) =>
                LinearGradient(colors: [Color(0xff088090), Color(0xff7EB5AB)])
                    .createShader(bounds),
            child: Text(
              "Welcome Zahr_sha,",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'amikosemi',
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
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/profilepic.jpg"),
                    radius: 30,
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
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 23),
              child: Text(
                "Recent Contests",
                style: TextStyle(
                    fontFamily: "amikosemi",
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 230,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: itemimages.length,
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
                              image: AssetImage('assets/happiness.jpg'),
                              fit: BoxFit.cover)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Photography",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: "amikosemi",
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "Theme: Happiness",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "amikosemi",
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                  );
                },
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
                    fontFamily: "amikosemi",
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 63,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      border: Border.all(color: Color(0xff088090))),
                  child: Row(
                    children: [
                      CircleAvatar(
                          backgroundImage: AssetImage("assets/contests.png")),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Contests",
                        style: TextStyle(
                            fontFamily: "amikosemi",
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      )
                    ],
                  ),
                ),
                Container(
                    height: 63,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(color: Color(0xff088090))),
                    child: Row(
                      children: [
                        CircleAvatar(
                            backgroundImage: AssetImage("assets/winners.png")),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Winners",
                          style: TextStyle(
                              fontFamily: "amikosemi",
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        )
                      ],
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
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
                            AssetImage("assets/shortlisted.png")),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Short listed",
                          style: TextStyle(
                              fontFamily: "amikosemi",
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        )
                      ],
                    )),
                Container(
                    height: 63,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(color: Color(0xff088090))),
                    child: Row(
                      children: [
                        CircleAvatar(
                            backgroundImage: AssetImage("assets/quiz.png")),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Quiz",
                          style: TextStyle(
                              fontFamily: "amikosemi",
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        )
                      ],
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),

            // Padding(
            //   padding: const EdgeInsets.all(12),
            //   child: Container(
            //     height: 250,
            //     width: 398,
            //     decoration: BoxDecoration(
            //       image: DecorationImage(
            //           image: AssetImage("assets/thinkhappy.png")),
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //   ),
            // )
            CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder: (context, index, realIndex) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(38),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                      ),
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

            buildIndiCator(images.length, context, Activeindex),
            // Text("data")
          ]),
        ),
      ),
    );
  }
}
buildIndiCator(int count, BuildContext context, int activeindex) {
  //    print(activeIndex.toString()+"dpddoopf");

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