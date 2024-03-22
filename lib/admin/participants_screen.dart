import 'package:flutter/material.dart';

class Participants extends StatefulWidget {
  const Participants({super.key});

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
  List<String> works = ["assets/oilpainting.png", "assets/story.png"];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: Icon(
              Icons.arrow_back_outlined,
              color: Color(0xff0C8290),
            ),
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
                SizedBox(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: names.length,
                      itemBuilder: ((context, index) {
                        return Container(
                          height: 400,
                          width: width / 2,
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15,right: 15),
                                child: Text(names[index],style: TextStyle(color: Colors.black,fontFamily: "amikosemi",fontSize: 20,fontWeight: FontWeight.bold),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15,right: 15),
                                child: Text(category[index],style: TextStyle(color: Colors.grey,fontFamily: "amikosemi",fontSize: 18,fontWeight: FontWeight.bold),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15,right: 15),
                                child: Container(
                                  padding: EdgeInsets.zero,
                                  height: 325,
                                  width: 337,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(works[index]),
                                          fit: BoxFit.fill)),
                                ),
                              ),
                              SizedBox(height: 8,),
                              Divider(color: Colors.grey,indent: 5,endIndent: 5,height: 5,)
                            ],
                          ),
                        );
                      })),
                )
              ],
            ),
          ),
        ));
  }
}