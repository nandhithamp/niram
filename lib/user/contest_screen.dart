import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:niram/constants/call_functions.dart';
import 'package:niram/provider/main_provider.dart';
import 'package:niram/user/shortlisted_screen.dart';
import 'package:provider/provider.dart';
import '../constants/refactoring.dart';
import 'contestdetial_screen.dart';

class ContestScreen extends StatelessWidget {
  String customerID,customerPhone,customerName;
  ContestScreen({super.key,required this.customerID,required this.customerPhone,required this.customerName});

  @override
  Widget build(BuildContext context) {
    // var provider = Provider.of<MainProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var names = [
      "Drawing",
      "Photography",
      "Writing",
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: (){
              back(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          title: Text(
            "Contests",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
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
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ShortlistedScreen(),
                                  ));
                            },
                            child: contestcategory(names[index]));
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("All"),
                        Text("Upcoming"),
                        Text("Ongoing"),
                        Text("Closed"),
                      ],
                    ),
                  ),
                  Consumer<MainProvider>(
                    builder: (context,value,child) {
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: value.contestList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: (){
                              callNext(context, ContestDetials(id: value.contestList[index].id, photo: value.contestList[index].photo,customerID: customerID,
                                category: value.contestList[index].category, categoryid: value.contestList[index].categoryid,
                                contest_theme:value.contestList[index].contest_theme,age: value.contestList[index].age,
                                registation_fee: value.contestList[index].registation_fee, status: value.contestList[index].status,
                                winning_price:value.contestList[index].winning_price, from_date: value.contestList[index].from_date,
                                to_date: value.contestList[index].to_date, termsand_condition: value.contestList[index].termsand_condition,
                              customerPhone: customerPhone,customerName: customerName,));
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10, top: 15),
                              child: Container(
                                height: height / 4,
                                width: width / 1.1,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 3,
                                          color: Colors.grey,
                                          offset: Offset(0, 3))
                                    ],
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image: NetworkImage(value.contestList[index].photo),
                                            // "assets/oil_painting.jpg"),
                                        fit: BoxFit.cover)),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: height / 100,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 10,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: width / 20,
                                          ),
                                          Text(
                                            // "Ongoing"
                                           value.contestList[index].status ,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: height / 28,
                                    ),
                                    Text(
                                      // "Digital Painting"
                                      value.contestList[index].category,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            "Theme : ",
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 20)),
                                        Text(
                                            // "Nature"
                                            value.contestList[index].contest_theme,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  )
                ],
              ),
            ),
            Image.asset(
              "assets/Vector 14.png",
            ),
          ],
        ),
      ),
    );
  }
}
