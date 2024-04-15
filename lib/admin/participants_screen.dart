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
  String from;
  Participants({super.key,required this.from});

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
        leading:widget.from=='ADMIN'?Icon(Icons.arrow_back_ios):SizedBox(),
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
              child: Text('Categories'),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Consumer<MainProvider>(builder: (context, value, child) {
                return Container(height: 50,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: ScrollPhysics(),
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
                            // width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: item.selectionBool?blueDark:
                              Color(0xff0C8290),
                            ),
                            child: Center(child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(item.catName,style: TextStyle(color: Colors.white),),
                            )),
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
              print(value.filterParticipatesList.length.toString()+' IROFFR IOR F');
              return SizedBox(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: value.filterParticipatesList.length,
                    itemBuilder: ((context, index) {
                      var item = value.filterParticipatesList[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: InkWell(onLongPress: (){
                    if(item.shortListStatus!='YES'){
                      makeShortListAlert(context,item.id);

                    }else{
    if(item.winnerStatus!='YES') {
      winnerAlert(context, item.id);
    }
                    }
                        },
                          onTap: (){
                          if(item.shortListStatus=='YES'){
                            winnerAlert(context,item.id);
                          }
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      item.customer,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "amikosemi",
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    item.winnerStatus=="YES"?
                                    Row(
                                      children: [
                                        Text('Winner'),
                                        Icon(Icons.wind_power,color: Colors.green,)
                                      ],
                                    ):item.shortListStatus=="YES"?
                                    Row(
                                      children: [
                                        Text('Short Listed'),
                                        Icon(Icons.verified,color: Colors.green,)
                                      ],
                                    ):SizedBox()
                                  ],
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

 makeShortListAlert(context,String id)  {
    return  showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(26),
            ),
            content: Container(
              width: 401,
              height: 213,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),

              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(height: 20,),

                  const Text(
                    "Confirm to short List",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 1.56,
                    ),
                  ),

                  const SizedBox(height: 35),

                  Consumer<MainProvider>(
                      builder: (context,valuee1,child) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 39,
                              width: 110,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all(Colors.transparent), // Remove overlay color
                                      shadowColor: MaterialStateProperty.all(Colors.blue.withOpacity(0.5)), // Set shadow color
                                      // Define the shadow properties
                                      elevation: MaterialStateProperty.all(5), //
                                      textStyle: MaterialStateProperty.all(
                                          const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w900)),
                                      backgroundColor: MaterialStateProperty.all(
                                          Colors.white),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(60)))),
                                  onPressed: () {
                                    Navigator.of(context).pop();

                                  },
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(
                                      color:Color(0xff1746A2),
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )),
                            ),
                            SizedBox(width: 12,),
                            SizedBox(
                              height: 39,
                              width: 110,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all(Colors.transparent), // Remove overlay color
                                      shadowColor: MaterialStateProperty.all(Colors.blue.withOpacity(0.5)), // Set shadow color
                                      // Define the shadow properties
                                      elevation: MaterialStateProperty.all(5), //
                                      textStyle: MaterialStateProperty.all(
                                          const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w900)),
                                      backgroundColor: MaterialStateProperty.all(
                                          Colors.green),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(60)))),
                                  onPressed: () {
                                    MainProvider mainprovider =Provider.of<MainProvider>(context,listen:false);

                                    mainprovider.makeShortList(id,context);
                                  },
                                  child: const Text(
                                    'Submit',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )),
                            ),

                          ],
                        );
                      }
                  ),
                ],
              ),
            ),
          );
        });
  }
 winnerAlert(context,String id)  {
    return  showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(26),
            ),
            content: Container(
              width: 401,
              height: 213,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),

              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(height: 20,),

                  const Text(
                    "Confirm to Make as Winner",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      height: 1.56,
                    ),
                  ),

                  const SizedBox(height: 35),

                  Consumer<MainProvider>(
                      builder: (context,valuee1,child) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 39,
                              width: 110,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all(Colors.transparent), // Remove overlay color
                                      shadowColor: MaterialStateProperty.all(Colors.blue.withOpacity(0.5)), // Set shadow color
                                      // Define the shadow properties
                                      elevation: MaterialStateProperty.all(5), //
                                      textStyle: MaterialStateProperty.all(
                                          const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w900)),
                                      backgroundColor: MaterialStateProperty.all(
                                          Colors.white),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(60)))),
                                  onPressed: () {
                                    Navigator.of(context).pop();

                                  },
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(
                                      color:Color(0xff1746A2),
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )),
                            ),
                            SizedBox(width: 12,),
                            SizedBox(
                              height: 39,
                              width: 110,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      overlayColor: MaterialStateProperty.all(Colors.transparent), // Remove overlay color
                                      shadowColor: MaterialStateProperty.all(Colors.blue.withOpacity(0.5)), // Set shadow color
                                      // Define the shadow properties
                                      elevation: MaterialStateProperty.all(5), //
                                      textStyle: MaterialStateProperty.all(
                                          const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w900)),
                                      backgroundColor: MaterialStateProperty.all(
                                          Colors.pink),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(60)))),
                                  onPressed: () {
                                    MainProvider mainprovider =Provider.of<MainProvider>(context,listen:false);

                                    mainprovider.winnerAssign(id,context);
                                  },
                                  child: const Text(
                                    'Winner',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )),
                            ),

                          ],
                        );
                      }
                  ),
                ],
              ),
            ),
          );
        });
  }

}
