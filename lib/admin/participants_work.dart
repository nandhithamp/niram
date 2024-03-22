import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ParticipantsWork extends StatefulWidget {
  const ParticipantsWork({super.key});

  @override
  State<ParticipantsWork> createState() => _ParticipantsWorkState();
}

int Activeindex = 0;

void caroselIndex(int index) {
  Activeindex = index;
}

class _ParticipantsWorkState extends State<ParticipantsWork> {
  @override
  Widget build(BuildContext context) {
    var images = [
      "assets/happiness.jpg",
      'assets/thinkhappy.png',
      'assets/oilpainting.png'
    ];
    final Shader linearGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[Color(0xff0C8290), Color(0xffBFAB78)],
    ).createShader(Rect.fromLTWH(10, 40, 100.0, 30.0));
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_outlined,
          color: Color(0xff0C8290),
        ),
        title: Text("Participant Work",
            style: TextStyle(
                fontFamily: "amikosemi",
                fontSize: 25,
                fontWeight: FontWeight.bold,
                foreground: Paint()..shader = linearGradient)),
      ),
      backgroundColor: Colors.white,
      body: Column(children: [
        // Divider(color: Colors.grey,endIndent: 1,indent: 1,height: 1),
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
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Text(
                "Participants Name :",
                style: TextStyle(fontFamily: 'amikosemi', fontSize: 20),
              ),
              Text(
                "Hiba",
                style: TextStyle(
                    fontFamily: 'amikosemi',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Text(
                "Contests:",
                style: TextStyle(fontFamily: 'amikosemi', fontSize: 20),
              ),
              Text(
                "Oil Painting",
                style: TextStyle(
                    fontFamily: 'amikosemi',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Text(
                "Theme:",
                style: TextStyle(fontFamily: 'amikosemi', fontSize: 20),
              ),
              Text(
                "Travel",
                style: TextStyle(
                    fontFamily: 'amikosemi',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ]),
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