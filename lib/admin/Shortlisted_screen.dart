import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/main_provider.dart';

class Shortlisted_screen extends StatelessWidget {
  const Shortlisted_screen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final Shader linearGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[Color(0xff0C8290), Color(0xffBFAB78)],
    ).createShader(Rect.fromLTWH(10, 40, 100.0, 30.0));

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(
          color: Color(0xff0C8290),
          size: 25,),
          centerTitle: true,
          title: Text("Shortlist",
          style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          foreground: Paint()..shader = linearGradient)),
          toolbarHeight: 70,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(4.0), // Adjust the height of the divider
            child: Divider(color: Color(0xff86B9B4), height: 4.0,thickness: 2), // Add Divider with desired color and height
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
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
      ),
    );
  }
}
