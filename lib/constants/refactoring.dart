import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget contestcategory( String name,){
  return   Padding(
    padding: const EdgeInsets.only(left:10,bottom: 20),
    child: Container(
      height: 40,
      width: 120,
      decoration: BoxDecoration(boxShadow: [BoxShadow(blurRadius: 2,color: Colors.grey,offset: Offset(0, 3)),],
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              colors: [Color(0xff3D9698).withOpacity(0.5), Color(0xff047E8F).withOpacity(0.6)])),
      child: Tab(
          icon: Text(
           name,
            style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.bold),
          )),
    ),
  );
}
PreferredSizeWidget apBar(context,String name){
  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return PreferredSize(
    preferredSize: Size.fromHeight(height/3), // Set the preferred size
    child: AppBar(
      backgroundColor: Colors.transparent,
      leading: Icon(Icons.arrow_back_ios, color: Colors.white),
      flexibleSpace: Stack(
        children: [
          Image.asset(
            'assets/contestappbar.png',
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              title: Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
            ),
          ),
        ],
      ),
    ),
  );
}
Widget container(double hgt,double width,String txt1,String txt2){
  return  Container(
    height:hgt,
    width: width,
    decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff1A8894),
            Color(0xff79B3AA),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(
            blurRadius: 3,
            color: Colors.grey,
            offset: Offset(0, 3)
        )]
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 10,top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,


        children: [
          Text(txt1,style: TextStyle(color: Colors.white,fontSize: 10),),
          Text(txt2,style: TextStyle(color: Colors.white,fontSize: 15),),
        ],
      ),
    ),
  );

}
Widget row(double width,double width2,String txt,){
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 6,),
        child: CircleAvatar(backgroundColor: Colors.grey,radius: 4,),
      ),
      SizedBox(width: width),
      SizedBox(width: width2,
          child: Text(txt,style: TextStyle(fontSize: 16),))
    ],
  );
}
Widget RegisterField(double hgt,double width,String name,TextEditingController controller){
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade500,
              offset: Offset(0, 2),
              blurRadius: 2)
        ],
        borderRadius: BorderRadius.circular(15)
    ),
    height:hgt,
    width: width,

    child: TextFormField(
      controller: controller,

      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          hintText: name,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
          border: InputBorder.none),
        validator: (value) {
          if (value!.trim().isEmpty) {
            return "Enter "+name;
          } else {
            return null;
          }
        }
    ),
  );
}
Widget RegisterField1(double hgt,double width,String name,int maxLength,TextEditingController controller){
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade500,
              offset: Offset(0, 2),
              blurRadius: 2)
        ],
        borderRadius: BorderRadius.circular(15)
    ),
    height:hgt,
    width: width,

    child: TextFormField(
      controller: controller,

      keyboardType: TextInputType.number,
      inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          hintText: name,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
          border: InputBorder.none),
    ),
  );
}
Widget textGradient(String txt){
  return ShaderMask(
    shaderCallback: (bounds) => LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Color(0xff0C8290), Color(0xffBFAB78)],
    ).createShader(bounds),
    child: Text(
      txt,
      style: TextStyle(
          fontSize: 25.0,
          color: Colors.white,
          fontWeight: FontWeight.bold),
    ),
  );
}
Widget adminhomebtn(String img,String txts){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 5),
    child: Container(
      height: 50,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Color(0xff047E8F)),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: 50,


              decoration: BoxDecoration(
                color: Colors.teal,
                shape: BoxShape.circle,
              ),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,

                    image: DecorationImage(image: AssetImage(img))
                ),
              ),
            ),
          ),
          Text(txts,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w200,
                fontFamily: "amikosemi"),
          ),
        ],

      ),
    ),
  );
}