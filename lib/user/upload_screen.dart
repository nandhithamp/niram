import 'package:flutter/material.dart';
import 'package:niram/constants/call_functions.dart';
import 'package:niram/user/home_screen.dart';
import 'package:provider/provider.dart';

import '../provider/main_provider.dart';

class UploadScreen extends StatelessWidget {
  String Contest_id;

   UploadScreen({super.key,required this.Contest_id});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipPath(
              clipper: CustomShape(),
              child: Container(
                color: Colors.pink,
                height: 200,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                        Color(0xff088090),
                        Color(0xff7EB5AB),
                      ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  child: Column(
                    children: [
                      AppBar(
                        leading:IconButton(
                          onPressed: () {
                            back(context);
                          },
                          icon: Icon(Icons.arrow_back_ios,size: 24,color: Colors.white,),
        
                        ) ,
                        title: Text(
                          "Upload your work",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        scrolledUnderElevation: 0,
                      ),
                    ],
                  ),
        
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Add three images of your work",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Consumer<MainProvider>(
                    builder: (context,value,child) {
                      return InkWell(onTap: () {
                        showBottomSheetwork1(context);
                      },
                        // child: Container(
                        //   height: 217,
                        //   width: 369,
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadiusDirectional.circular(15),
                        //       border: Border.all(color: Colors.black),
                        //       // Icon(Icons.access_alarm),
                        //       color: Colors.transparent),
                        //   child: Image.asset(
                        //     "assets/image_vector.png",
                        //     scale: 6,
                        //   ),
                        // ),
                        child:value.addContestFileImg!=null?Container(
                          width: width,
                          height: height / 4,
                          color: Color(0xffD9D9D9),
                          child: Image.file(
                            value.addContestFileImg!,
                            scale: 4,
                          ),
                        ):value.ContestImg!=""?Container(
                          width: width,
                          height: height / 4,
                          color: Color(0xffD9D9D9),
                          child:Image.network(
                            value.ContestImg.toString(),
                            scale: 4,
                          ),
                        ):Container(
                            height: 217,
                            width: 369,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.circular(15),
                                border: Border.all(color: Colors.black),
                                // Icon(Icons.access_alarm),
                                color: Colors.transparent),
                            child: Image.asset(
                              "assets/image_vector.png",
                              scale: 6,
                            ),

                        ),
                      );
                      // );
                    }
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Consumer<MainProvider>(
                    builder: (context,value,child) {
                      return InkWell(onTap: () {
                        showBottomSheetwork2(context);
                      },
                        child:value.addContestFileImg!=null?Container(
                          width: width,
                          height: height / 4,
                          color: Color(0xffD9D9D9),
                          child: Image.file(
                            value.addContestFileImg!,
                            scale: 4,
                          ),
                        ):value.ContestImg!=""?Container(
                          width: width,
                          height: height / 4,
                          color: Color(0xffD9D9D9),
                          child:Image.network(
                            value.ContestImg.toString(),
                            scale: 4,
                          ),
                        ):Container(
                          height: 217,
                          width: 369,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(15),
                              border: Border.all(color: Colors.black),
                              // Icon(Icons.access_alarm),
                              color: Colors.transparent),
                          child: Image.asset(
                            "assets/image_vector.png",
                            scale: 6,
                          ),

                        ),
                      );
                    }
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Consumer<MainProvider>(
                    builder: (context,value,child) {
                      return InkWell(onTap: () {
                        showBottomSheetwork3(context);
                      },
                        child:value.addContestFileImg!=null?Container(
                          width: width,
                          height: height / 4,
                          color: Color(0xffD9D9D9),
                          child: Image.file(
                            value.addContestFileImg!,
                            scale: 4,
                          ),
                        ):value.ContestImg!=""?Container(
                          width: width,
                          height: height / 4,
                          color: Color(0xffD9D9D9),
                          child:Image.network(
                            value.ContestImg.toString(),
                            scale: 4,
                          ),
                        ):Container(
                          height: 217,
                          width: 369,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadiusDirectional.circular(15),
                              border: Border.all(color: Colors.black),
                              // Icon(Icons.access_alarm),
                              color: Colors.transparent),
                          child: Image.asset(
                            "assets/image_vector.png",
                            scale: 6,
                          ),

                        ),
                      );
                    }
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: (){
                      //callNext(context, HomeScreen());
                    },
                    child: Center(
                      child: Consumer<MainProvider>(
                        builder: (context,value,child) {
                          return InkWell(onTap: () {
                            value.UploadWork(context, Contest_id);
                          },
                            child: Container(
                              height: 49,
                              width: 230,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        // Color.fromARGB(255, 132, 163, 165),
                                        Color(0xff3D9698),
                                        Color(0xff0996A9),
                                        // Color(0xff8CA3A1)

                                      ])
                                // color: Colors.amber
                              ),
                              child: Center(
                                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Upload",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Icon(Icons.upload_outlined,color: Colors.white,)
                                    ],
                                  )),
                            ),
                          );
                        }
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
        
                ],
              ),
            ),
        
          ],
        ),
      ),

      ),
    );
  }

  void showBottomSheetwork1(BuildContext context) {
    MainProvider mainprovider =Provider.of<MainProvider>(context,listen:false);
    showModalBottomSheet(
        elevation: 10,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            )),
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
            children: <Widget>[
              ListTile(
                  leading:  Icon(
                    Icons.camera_enhance_sharp,
                    color: Colors.green,
                  ),
                  title: const Text('Camera',),
                  onTap: () => {
                    mainprovider.getImgwork1camera(), Navigator.pop(context)
                  }),
              ListTile(
                  leading:  Icon(Icons.photo, color: Colors.green),
                  title: const Text('Gallery',),
                  onTap: () => {
                    mainprovider.getImgwork1gallery(),Navigator.pop(context)
                  }),
            ],
          );
        });
    // ImageSource
  }

  void showBottomSheetwork2(BuildContext context) {
    MainProvider mainprovider =Provider.of<MainProvider>(context,listen:false);
    showModalBottomSheet(
        elevation: 10,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            )),
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
            children: <Widget>[
              ListTile(
                  leading:  Icon(
                    Icons.camera_enhance_sharp,
                    color: Colors.green,
                  ),
                  title: const Text('Camera',),
                  onTap: () => {
                    mainprovider.getImgwork2camera(), Navigator.pop(context)
                  }),
              ListTile(
                  leading:  Icon(Icons.photo, color: Colors.green),
                  title: const Text('Gallery',),
                  onTap: () => {
                    mainprovider.getImgwork2gallery(),Navigator.pop(context)
                  }),
            ],
          );
        });
    // ImageSource
  }
  void showBottomSheetwork3(BuildContext context) {
    MainProvider mainprovider =Provider.of<MainProvider>(context,listen:false);
    showModalBottomSheet(
        elevation: 10,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            )),
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
            children: <Widget>[
              ListTile(
                  leading:  Icon(
                    Icons.camera_enhance_sharp,
                    color: Colors.green,
                  ),
                  title: const Text('Camera',),
                  onTap: () => {
                    mainprovider.getImgwork3camera(), Navigator.pop(context)
                  }),
              ListTile(
                  leading:  Icon(Icons.photo, color: Colors.green),
                  title: const Text('Gallery',),
                  onTap: () => {
                    mainprovider.getImgwork3gallery(),Navigator.pop(context)
                  }),
            ],
          );
        });
    // ImageSource
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width / 2, height, width, height - 50);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
