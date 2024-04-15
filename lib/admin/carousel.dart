import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/category_model.dart';
import '../provider/main_provider.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {

  final Shader linearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: <Color>[Color(0xff0C8290), Color(0xffBFAB78)],
  ).createShader(Rect.fromLTWH(10, 40, 100.0, 30.0));
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
        color: Color(0xff0C8290),
        size: 25,
      ),
        centerTitle: true,
        title: Text("Carousel",
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
                    value.addCarousel(context);
                    // value.clearCarousel();
                },
                child: Text(
                  "Save",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "amikosemi",
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
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
            children: [
              Consumer<MainProvider>(
                  builder: (context,value,child) {
                    return InkWell(onTap: () {
                      showBottomSheet(context);
                    },
                      child:value.addCarouselImg!=null?Container(
                        width: width,
                        height: height / 4,
                        color: Color(0xffD9D9D9),
                        child: Image.file(
                          value.addCarouselImg!,
                          scale: 4,
                        ),
                      ):value.CarouselImg!=""?Container(
                        width: width,
                        height: height / 4,
                        color: Color(0xffD9D9D9),
                        child:Image.network(
                          value.CarouselImg.toString(),
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
                          fieldTextEditingController.text = value.categorynamecontroller.text;
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
                        value.categorynamecontroller.text = selection.categoryname;
                        value.Selectedcategoryid = selection.id;
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

                        controller: value.contestthemecontroller,
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


            ],
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
                    mainprovider.getCarouselImgcamera(), Navigator.pop(context)
                  }),
              ListTile(
                  leading:  Icon(Icons.photo, color: Colors.green),
                  title: const Text('Gallery',),
                  onTap: () => {
                    mainprovider.getCarouselImggallery(),Navigator.pop(context)
                  }),
            ],
          );
        });
    // ImageSource
  }
}
