import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:niram/constants/call_functions.dart';
import 'package:niram/provider/main_provider.dart';
import 'package:provider/provider.dart';

import '../constants/mycolors.dart';
import '../models/category_model.dart';


class AddContests extends StatefulWidget {
  String from;
  String oldid;
   AddContests({super.key,required this .from,required this.oldid});

  @override
  State<AddContests> createState() => _AddContestsState();
}

class _AddContestsState extends State<AddContests> {
  final Shader linearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[Color(0xff0C8290), Color(0xffBFAB78)],
  ).createShader(Rect.fromLTWH(10, 40, 100.0, 30.0));
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Color(0xff0C8290),
            size: 25,
          ),
          centerTitle: true,
          title: Text("Contest",
              style: TextStyle(
                  fontFamily: "amikosemi",
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..shader = linearGradient)),
        ),
        floatingActionButton: Container(
          height: height / 16,
          width: width / 3,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff248C96),
                  Color(0xffA7CCC4),
                ],
              )
          ),
          child: Consumer<MainProvider>(
            builder: (context,value,child) {
              return FloatingActionButton(
                backgroundColor: Colors.transparent,
                onPressed: () {

                  },
                child: InkWell(onTap: () {
                  // print("wdjvnfev"+widget.oldid);
                  if(widget.from=="NEW"){
                    value.addContest(widget.from,"");
                  }else{
                    // print("vhjfvf");
                    value.addContest(widget.from,widget.oldid);
                  }
                  Navigator.pop(context);
                },
                  child: Text(
                    "Save",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "amikosemi",
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              );
            }
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return InkWell(onTap: () {
                      showBottomSheet(context);
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
                        width: width,
                        height: height / 4,
                        color: Color(0xffD9D9D9),
                        child: Image.asset(
                          "assets/addimage.png",
                          scale: 4,
                        ),
                      ),
                    );
                  }
                ),
                SizedBox(
                  height: 20,
                ),


                Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return Autocomplete<CategoryModel>(
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        return value.categoryList
                            .where((CategoryModel item) => item. categoryname
                            .toLowerCase()
                            .contains(textEditingValue.text.toLowerCase()))
                            .toList();
                      },
                      displayStringForOption: (CategoryModel option) =>
                      option.categoryname,
                      fieldViewBuilder: (BuildContext context,
                          TextEditingController fieldTextEditingController,
                          FocusNode fieldFocusNode,
                          VoidCallback onFieldSubmitted) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          fieldTextEditingController.text = value.categorynamect.text;
                        });

                        return Container(

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:Color(0xff0C8290),
                            // ,
                          ),

                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 1.1,
                            child: TextFormField(
                              // cursorColor: Colors.brown,
                              maxLines: 1,
                              style: const TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.w200),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xff0C8290)),
                                    borderRadius: BorderRadius.circular(10)
                                ),

                                hintText: "Select Category",
                                hintStyle: const TextStyle(

                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal
                                ),
                                border: OutlineInputBorder(borderSide: BorderSide(color: Color(0xff0C8290)),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onChanged: (txt) {},
                              controller: fieldTextEditingController,
                              focusNode: fieldFocusNode,
                            ),
                          ),
                        );
                      },
                      onSelected: (CategoryModel selection) {
                        value.categorynamect.text = selection.categoryname;
                        value.productSelectedcategoryid = selection.id;
                      },
                      optionsViewBuilder: (BuildContext context,
                          AutocompleteOnSelected<CategoryModel> onSelected,
                          Iterable<CategoryModel> options) {
                        return Align(
                          alignment: Alignment.topLeft,
                          child: Material(
                            child: Container(

                              decoration: BoxDecoration(
                                  color:Color(0xff0C8290),
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              width: 200,
                              height: 200,
                              child: ListView.builder(
                                padding: const EdgeInsets.all(10.0),
                                itemCount: options.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final CategoryModel option = options.elementAt(index);

                                  return GestureDetector(
                                    onTap: () {
                                      onSelected(option);
                                    },
                                    child: Column(
                                      children: [
                                        Container(

                                          decoration: BoxDecoration(
                                            // border: Border(left: BorderSide(color: Colors.white,width: .6,
                                            // ))
                                          ),

                                          height: 30,
                                          width: 200,
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Center(
                                                  child: Text(option.categoryname,
                                                      style: const TextStyle(
                                                        fontFamily: 'cantata',
                                                        color: Colors.black,
                                                      )
                                                  ),
                                                ),
                                              ]),
                                        ),
                                        Divider(
                                          thickness: 1,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                ),
                SizedBox(
                  height: 20,
                ),
                Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return Container(
                      height: height / 13,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff0C8290),
                      ),
                      child: TextField(

                        controller: value.contestthemect,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding:  EdgeInsets.symmetric(horizontal: 10),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          alignLabelWithHint: true,
                          label: Text(
                            'Contest Theme',style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.normal),
                          ),
                        ),


                      ),
                    );
                  }
                ),


                SizedBox(
                  height: 20,
                ),
                Container(
                  height: height / 13,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff0C8290),
                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text(
                        "  Age Limit",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      ),

                      Container(
                        width: 120,
                        height: 50,
                        color: Color(0xff0C8290),
                        child: Consumer<MainProvider>(
                            builder: (context, value,child) {
                              return DropdownButton(
                                // Initial Value
                                underline:Container(color: Colors.white) ,
                                value:value.dropdownval,
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                items:value.Age.map((String item) {
                                  return DropdownMenuItem(
                                    value: item,
                                    child: Text(item,style: TextStyle(color: Colors.black),),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  value.dropdown(newValue!);
                                },
                              );
                            }
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return Container(
                      height: height / 13,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff0C8290),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Registration Fee",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal),
                            ),
                            Container(

                              height: 35,width: 100,
                              child: TextField(
                                controller: value.registrationfeect,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    fillColor:grey,filled: true,
                                    border: InputBorder.none
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: height / 13,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff0C8290),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Status",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.normal),
                        ),
                        Container(
                          width: 121,
                          height: 50,
                          color: Color(0xff0C8290),
                          child: Consumer<MainProvider>(
                              builder: (context, value,child) {
                                return DropdownButton(
                                  // Initial Value
                                  underline:Container(color: Colors.white) ,
                                  value:value.dropdownval1,
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  items:value.Status.map((String item) {
                                    return DropdownMenuItem(
                                      value: item,
                                      child: Text(item,style: TextStyle(color: Colors.black),),
                                    );
                                  }).toList(),
                                  onChanged: (String? newValue1) {
                                    value.dropdown1(newValue1!);
                                  },
                                );
                              }
                          ),
                        ),

                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return Container(
                      height: height / 13,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff0C8290),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Winning Price",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal),
                            ),
                            Container(

                              height: 35,width: 100,
                              child: TextField(
                                controller: value.winningpricect,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    fillColor:grey,filled: true,
                                    border: InputBorder.none
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Duration",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.normal),
                ),
                Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return Row(
                      children: [
                        InkWell(onTap: () {
                          value.selectDate(context);
                        },
                          child: Container(
                            height: height / 15,
                            width: width / 2.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xff0C8290)),
                            child: Center(
                                child: Text(
                              // "From Date",
                              value.fromdateController.text,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal),
                            )),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(onTap:() {
                          value.selecttoDate(context);
                    },
                          child: Container(
                            height: height / 15,
                            width: width / 2.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xff0C8290)),
                            child: Center(
                                child: Text(
                              // "To Date",
                                  value.todateController.text,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal),
                            )),
                          ),
                        ),
                      ],
                    );
                  }
                ),

                SizedBox(
                  height: 5,
                ),
                Text(
                  "Terms and Conditions",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 5,
                ),
                Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return Container(
                      height: height / 4,
                      width: width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff0C8290),

                      ),
                      child: TextField(
                        maxLines: 50,
                        controller: value.termsandconditionct,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding:  EdgeInsets.symmetric(horizontal: 10),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          alignLabelWithHint: true,
                          label: Text(
                            '',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                    );
                  }
                ),
              ],
            ),
          ),
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
                    mainprovider.getImgcamera(), Navigator.pop(context)
                  }),
              ListTile(
                  leading:  Icon(Icons.photo, color: Colors.green),
                  title: const Text('Gallery',),
                  onTap: () => {
                    mainprovider.getImggallery(),Navigator.pop(context)
                  }),
            ],
          );
        });
    // ImageSource
  }
}
