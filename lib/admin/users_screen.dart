import 'package:flutter/material.dart';

class Users extends StatelessWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;

    final Shader linearGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[Color(0xff0C8290), Color(0xffBFAB78)],
    ).createShader(Rect.fromLTWH(10, 40, 100.0, 30.0));

    List<String> jury_name = ["Name", "Name","Name","Name"];
    List<String> jury_destination=["Destination","Destination","Destination","Destination"];
    List<String> jury_phone=["phone","phone","phone","phone",];
    List<String> jury_place=["place","place","place","place",];
    List<String> images = ["assets/person1.png", "assets/person2.png","assets/person3.png","assets/person4.png"];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.arrow_back_outlined,
            color: Color(0xff0C8290),
          ),
          title: Text("Users",
              style: TextStyle(
                  fontFamily: "amikosemi",
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..shader = linearGradient)),
        ),


        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: jury_name.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                            height: 131,
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color(0xff047E8F),
                            ),
                            child: Row(

                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(images[index]),
                                    radius: 50,
                                  ),
                                ),
                                SizedBox(width: 30,),
                                Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    Text(jury_name[index],style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'amikosemi'),),
                                    Text(jury_destination[index],style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'amikosemi'),),
                                    Text(jury_phone[index],style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'amikosemi'),),
                                    Text(jury_place[index],style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'amikosemi'),)
                                  ],
                                )
                              ],
                            )),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}