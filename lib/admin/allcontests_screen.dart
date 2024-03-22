import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllContests extends StatelessWidget {
  const AllContests({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final Shader linearGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[Color(0xff0C8290), Color(0xffBFAB78)],
    ).createShader(Rect.fromLTWH(10, 40, 100.0, 30.0));

    List<String> contests = ["All", "Ongoing", "Closed", "Upcoming"];
    List<String> Images = [
      "assets/digital.jpg",
      "assets/digitalfree.jpg",
      "assets/digitalp.jpg",
      // "assets/digitalpainting.jpeg",
    ];
    List<String> titles = [
      "Upcoming",
      "Digital Painting\n Theme:Nature",
      "Oil Painting\n Theme:Nature"
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Icon(Icons.arrow_back_outlined, color: Color(0xff0C8290),size: 25,),
          title: Text(
            "Contest",
            style: TextStyle(
                fontSize: 25,
                fontFamily: "amikosemi",
                fontWeight: FontWeight.bold,
                foreground: Paint()..shader = linearGradient),
          ),
        ),
        backgroundColor: Colors.white,


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
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Text(
                'Add New Contest',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),




        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: width / 1.5,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            prefixIcon: Icon(
                              Icons.search_sharp,
                              color: Colors.grey,
                              size: 35,
                            )),
                      ),
                    ),
                  ),
          
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Filters",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: "amikosemi",
                      foreground: Paint()..shader = linearGradient,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.filter_list_sharp,
                    color: Color(0xff0C8290),
                  )
                ],
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 50,
                child: ListView.builder(
                    itemCount: contests.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(


                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              border: Border.all(color: Colors.grey)),
                          height:35 ,
                          width: 70,
                          child: Center(child: Text(contests[index],style: TextStyle(fontSize: 10),)),
                        ),
                      );
                    })),
              ),
              SizedBox(
                height: 500,
                child: ListView.builder(
                    itemCount: Images.length,
                    shrinkWrap: true,
          
                    scrollDirection: Axis.vertical,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: height / 4,
                          width: width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // color: Colors.pink,
                              image: DecorationImage(
                                  image: AssetImage(Images[index]),
                                  fit: BoxFit.fill)),
                          child: Center(
                              child: Text(
                                titles[index],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )),
                        ),
                      );
                    })),
              )
            ],
          ),
        ),
      ),
    );
  }
}