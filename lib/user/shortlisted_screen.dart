import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/call_functions.dart';
import '../provider/main_provider.dart';

class ShortlistedScreen extends StatelessWidget {
  const ShortlistedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;


    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.white,
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
            "Shortlisted",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),

        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height/7,
                ),
                Consumer<MainProvider>(
                    builder: (context1, value, child) {
                      return value.ShortlistedList.isNotEmpty?
                      ListView.builder(
                        itemCount: value.ShortlistedList.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var item = value.ShortlistedList[index];
                          //print(item.list);
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 35),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.customer,
                                        style: TextStyle(

                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Text(item.category + " | " + item.contest_theme,
                                          style: TextStyle(

                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                              color: Colors.grey)),
                                      SizedBox(height: 10,),

                                      Container(
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(blurRadius: 15, color: Colors.grey)
                                            ], borderRadius: BorderRadius.circular(10)),
                                        height: height / 2.5,
                                        width: width ,
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Image.network(item.list[0],
                                                fit: BoxFit.cover)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Divider(
                                  color: Colors.black12,
                                  // endIndent: 2,
                                  // indent: 2,
                                  thickness: 1),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          );
                        },
                      ) :
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text("NO DATA TO SHOW.",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                      ;
                    }
                ),
              ],
            ),
          ),
            Image.asset('assets/Vector 14.png'),
          ]
        ),
      ),
    );
  }
}
