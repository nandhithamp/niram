

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:niram/provider/main_provider.dart';
import 'package:provider/provider.dart';

import '../constants/call_functions.dart';

class Admins extends StatelessWidget {

  Admins({super.key,});

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
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Color(0xff0C8290),
            size: 25,
          ),
        centerTitle: true,
          title: Text("Admins",
              style: TextStyle(

                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..shader = linearGradient)),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Consumer<MainProvider>(
          builder: (context,value,child) {
            return Container(
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
                  )),
              child: Consumer<MainProvider>(
                builder: (context,value,child) {
                  return FloatingActionButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            // filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Center(
                              child: SingleChildScrollView(
                                child: AlertDialog(
                                    backgroundColor:
                                        Color(0xffD9D9D9).withOpacity(0.85),
                                    actions: <Widget>[
                                      SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        height: height / 3,
                                        child: Column(
                                          children: [
                                            Consumer<MainProvider>(
                                              builder: (context,value,child) {
                                                return InkWell(onTap: () {
                                                  showBottomSheet(context);
                                                },
                                                child:value.addAdminImg!=null?CircleAvatar(
                                                    backgroundColor: Colors.white,
                                                    radius: 40,
                                                    child: Image.file(
                                                      value.addAdminImg!,
                                                      scale: 4,
                                                    ),
                                                ):value.AdminImg!=""?CircleAvatar(
                                                    backgroundColor: Colors.white,
                                                    radius: 40,
                                                    child: Image.network(
                                                        value.AdminImg.toString()
                                                )): CircleAvatar(
                                                        backgroundColor: Colors.white,
                                                        radius: 40,
                                                        child: Icon(
                                                          Icons.add_photo_alternate_outlined,
                                                          size: 35,
                                                          color: Colors.grey,
                                                        )
                                                    ),

                                                );
                                              }
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Consumer<MainProvider>(
                                              builder: (context,value,child) {
                                                return TextFormField(
                                                  controller: value.AdminnameController,
                                                  keyboardType: TextInputType.text,
                                                  decoration: InputDecoration(
                                                      fillColor: Colors.white,
                                                      filled: true,
                                                      border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(15),
                                                      ),
                                                      hintText: "Name",
                                                      hintStyle: TextStyle(
                                                          color: Colors.grey,

                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold)),
                                                );
                                              }
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Consumer<MainProvider>(
                                              builder: (context,value,child) {
                                                return TextFormField(
                                                  controller: value.DesignationController,
                                                  keyboardType: TextInputType.text,
                                                  decoration: InputDecoration(
                                                      fillColor: Colors.white,
                                                      filled: true,
                                                      border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(15),
                                                      ),
                                                      hintText: "Designation",
                                                      hintStyle: TextStyle(
                                                          color: Colors.grey,

                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold)),
                                                );
                                              }
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Consumer<MainProvider>(
                                        builder: (context,value,child) {
                                          return Center(
                                            child: TextButton(
                                              onPressed: () {
                                                value.addAdmins();
                                                back(context);
                                              },
                                              child: Container(
                                                height: height / 12,
                                                width: width / 2.5,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(30),
                                                    gradient: const LinearGradient(
                                                      begin: Alignment.topCenter,
                                                      end: Alignment.bottomCenter,
                                                      colors: [
                                                        Color(0xff248C96),
                                                        Color(0xffA7CCC4),
                                                      ],
                                                    )),
                                                child: Center(
                                                    child: Text(
                                                  "Add",
                                                  style: TextStyle(
                                                      color: Colors.white,

                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold),
                                                )),
                                              ),
                                            ),
                                          );
                                        }
                                      )
                                    ]),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    //backgroundColor: Colors.blueGrey,
                    backgroundColor: Colors.transparent,
                    child: Text(
                      "Add Admins",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "amikosemi",
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  );
                }
              ),
            );
          }
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
                child: Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return ListView.builder(

                        shrinkWrap: true,
                        itemCount: value.adminsList.length,
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
                                        backgroundImage: NetworkImage(value.adminsList[index].admin_photo),
                                        radius: 50,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: width / 2.8,
                                            ),
                                            Consumer<MainProvider>(
                                              builder: (context,value,child) {
                                                return InkWell(onTap: () {
                                                  value.editAdmins(value.adminsList[index].id.toString());

                                                },
                                                  child: Image.asset(
                                                    "assets/edit.png",
                                                    scale: 4,
                                                  ),
                                                );
                                              }
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Consumer<MainProvider>(
                                              builder: (context,value,child) {
                                                return InkWell(onTap: () {
                                                  // value.deleteAdmin();
                                                },
                                                  child: Image.asset(
                                                    "assets/delete.png",
                                                    scale: 4,
                                                  ),
                                                );
                                              }
                                            ),
                                          ],
                                        ),
                                        Text( value.adminsList[index].admin_name.toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(value.adminsList[index].admin_designation.toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: height / 20,
                                        ),
                                      ],
                                    ),

                                  ],
                                )),
                          );
                        });
                  }
                )),
          ],
        ),
      ),
    );
  }
  void showBottomSheet(BuildContext context) {
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
                    mainprovider.AdmingetImagecamera(), Navigator.pop(context)
                  }),
              ListTile(
                  leading:  Icon(Icons.photo, color: Colors.green),
                  title: const Text('Gallery',),
                  onTap: () => {
                    mainprovider.AdmingetImagegallery(),Navigator.pop(context)
                  }),
            ],
          );
        });
    // ImageSource
  }
}

