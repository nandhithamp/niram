import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:niram/constants/call_functions.dart';
import 'package:niram/provider/main_provider.dart';
import 'package:provider/provider.dart';

import 'add_contest.dart';
import 'contestdescription_screen.dart';

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
    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Color(0xff0C8290),
            size: 25,
          ),

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
          child: Consumer<MainProvider>(
            builder: (context,val,child) {
              return FloatingActionButton(
                backgroundColor: Colors.transparent,
                onPressed: (){
                  val.getCategory();
                  val.contestclear();
                callNext(context, AddContests(from:"NEW", oldid: '',));
                },
                child: Text(
                  'Add New Contest',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              );
            }
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
                child: Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return ListView.builder(
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
                        }));
                  }
                ),
              ),
              Consumer<MainProvider>(
                builder: (context,val,child) {
                  print("dcjcbn"+val.contestList.length.toString());
                  return SizedBox(

                    child: ListView.builder(
                      physics: ScrollPhysics(),
                        itemCount: val.contestList.length,
                        shrinkWrap: true,


                        scrollDirection: Axis.vertical,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: (){
                                callNext(context, ContestDescriptions(id: val.contestList[index].id, photo: val.contestList[index].photo,
                                  category: val.contestList[index].category,categoryid:val.contestList[index].categoryid,
                                  contest_theme:val.contestList[index].contest_theme, age: val.contestList[index].age,
                                  registation_fee: val.contestList[index].registation_fee,status: val.contestList[index].status,
                                  winning_price: val.contestList[index].winning_price, from_date:val.contestList[index].from_date,
                                  to_date: val.contestList[index].to_date, termsand_condition: val.contestList[index].termsand_condition,));
                              },
                              child: Container(
                                height: height / 4,
                                width: width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    // color: Colors.pink,
                                    image: DecorationImage(
                                        image: NetworkImage(val.contestList[index].photo),
                                        fit: BoxFit.fill)),
                                child: Center(
                                    child: Text(
                                      val.contestList[index].category.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )),
                              ),
                            ),
                          );
                        })),
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}