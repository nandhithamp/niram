import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/call_functions.dart';
import '../provider/main_provider.dart';

class Winnersuser extends StatelessWidget {
  const Winnersuser({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final Shader linearGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[Color(0xff0C8290), Color(0xffBFAB78)],
    ).createShader(Rect.fromLTWH(10, 40, 100.0, 30.0));
    List<String> winnersimages = [
      "assets/mom.jpg",
      "assets/happiness.jpg",
      "assets/canoe.jpg"
    ];
    List<String> medals = [
      "assets/medal 1.jpg",
      //"assets/medal second 1.jpg",
      "assets/medal 1.jpg",
    ];
    List<String> winnersName = [
      "Ayisha",
      "Rayan",
      "Sneha"
    ];
    List<String> wrk = [
      "Digital Painting",
      "Phography",
      "Phography"
    ];
    List<String> theme = [
      "Theme:Mom",
      "Theme:happiness",
      "Theme:photography"
    ];
    return Scaffold(
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
          "Winners",
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
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                  height: height/5,
                ),
                Consumer<MainProvider>(
                    builder: (context1,value, child) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          height: height / 12,
                          width: width,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xff0C8290),
                            borderRadius: BorderRadius.circular(10),
                            // border: Border.all(color: txtfrmbordercolor)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0, left: 8, right: 8),
                            child: DropdownButtonHideUnderline(

                              child: DropdownButton(
                                dropdownColor: Color(0xff0C8290),
                                // Initial Value
                                value: value.winnerdropdownvalue,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                focusColor: Color(0xff0C8290),
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                // disabledHint: Text("Select Category",
                                //   style: TextStyle(
                                //     color: Colors.white,
                                //     fontSize: 20,
                                //     fontWeight: FontWeight.normal),
                                // ),
                                // hint: Text("Select Category",
                                //   style: TextStyle(
                                //       color: Colors.white,
                                //       fontSize: 20,
                                //       fontWeight: FontWeight.normal),
                                // ),
                                isExpanded: true,
                                //isDense: true,


                                // Down Arrow Icon
                                icon: const Icon(Icons.arrow_drop_down,
                                  color: Colors.white,
                                  size: 30,),

                                // Array list of items
                                items: value.categorynameList.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (String? newValue) {
                                  value.change_contestdropdownval(newValue!);
                                  value.get_contestwinner(newValue);
                                },

                              ),
                            ),
                          ),
                        ),
                      );
                    }
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Consumer<MainProvider>(
                      builder: (context1, value, child) {
                        return value.WinnerList.isNotEmpty?
                        ListView.builder(
                          itemCount: value.WinnerList.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var item = value.WinnerList[index];
                            //print(item.list);
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(boxShadow: [
                                        BoxShadow(blurRadius: 15, color: Colors.grey)
                                      ], borderRadius: BorderRadius.circular(10)),
                                      height: height / 5,
                                      width: width / 3,
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.network(item.list[0],
                                              fit: BoxFit.cover)),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          medals[0],
                                          scale: 15,
                                        ),
                                        Text(
                                          item.customer,
                                          style: TextStyle(

                                              fontWeight: FontWeight.bold,
                                              fontSize: 24),
                                        ),
                                        Text(item.category,
                                            style: TextStyle(

                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Colors.grey)),
                                        Text(
                                            item.contest_theme,
                                            style: TextStyle(

                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Colors.grey)),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Divider(
                                    color: Colors.grey,
                                    endIndent: 2,
                                    indent: 2,
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
                ),
              ],
            ),
          ),
        ),
          Image.asset('assets/Vector 14.png'),
        ],
      ),
    );
  }
}