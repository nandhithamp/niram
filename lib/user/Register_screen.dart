import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:niram/provider/main_provider.dart';
import 'package:niram/user/login_screen.dart';
import 'package:provider/provider.dart';

import '../constants/call_functions.dart';
import '../constants/refactoring.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(width: width,
                height: height / 4.5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/Vector 6 (5).png"),
                        fit: BoxFit.cover)),
                child:Form(key: formKey,
                  child: Column(
                    children: [
                      SizedBox(height: height/80,),
                      Padding(
                        padding:  EdgeInsets.only(right: width/30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(height: height/20,),
                            CircleAvatar(
                              radius: 21,
                              backgroundColor: Colors.teal.shade200,
                              child: CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage("assets/niram_logo.jpg"),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
      
              ),
              Center(
                child: Column(
                  children: [

                    textGradient( "   Create Account \nto get started now!,"),
                    Consumer<MainProvider>(
                      builder: (context,value,child) {
                        return InkWell(
                          onTap: () {
                            showBottomSheet(context);
                          },
                          child:
                          value.addUsersImg!=null?Container(
                            height: 100,width: 100,
                            child: ClipRRect( borderRadius: BorderRadius.circular(10),
                              child: Image.file(value.addUsersImg!,fit: BoxFit.cover,
                              scale: 4,
                              ),
                            ),
                          ):
                          value.UsersImg!=""&&value.addUsersImg!=null?CircleAvatar(
                              backgroundColor:Color(0xff249C99),
                              radius: 40,
                              child: Image.network(
                                  value.UsersImg.toString()
                              )): CircleAvatar(
                              backgroundColor:Color(0xff249C99),
                              radius: 40,
                              child: Icon(
                                Icons.add_photo_alternate_outlined,
                                size: 35,
                                color: Colors.white,
                              )
                              // Icon(
                              //   Icons.add_photo_alternate_outlined,
                              //   size: 35,
                              //   color: Colors.white,)
                          ),
                        );
                      }
                    ),

                    // SizedBox(height: 5,),
                    SizedBox(
                      height: height / 30,
                    ),
                    Consumer<MainProvider>(
                      builder: (context,value,child) {
                        return RegisterField(height / 18, width / 1.15, "  Name",value.NameController);
                      }
                    ),
                    SizedBox(
                      height: height / 80,
                    ),
                    Consumer<MainProvider>(
                      builder: (context,value,child) {
                        return RegisterField1(height / 18, width / 1.15, "  Phone Number",10,value.PhoneNumberController);
                      }
                    ),


                    SizedBox(
                      height: height / 80,
                    ),
                    Consumer<MainProvider>(
                      builder: (context,value,child) {
                        return RegisterField1(height / 18, width / 1.15, "  Age",2,value.AgeController);
                      }
                    ),
                    SizedBox(
                      height: height / 80,
                    ),
                    Consumer<MainProvider>(
                      builder: (context,value,child) {
                        return RegisterField(height / 18, width / 1.15, "  Place",value.PlaceController);
                      }
                    ),
                    SizedBox(
                      height: height / 30,
                    ),
                    Consumer<MainProvider>(
                      builder: (context,value,child) {
                        return InkWell(
                          onTap: (){
                        var form = formKey.currentState;
                        if (form!.validate()) {
                          if(value.NameController.text.isNotEmpty&&value.PhoneNumberController.text.isNotEmpty&&value.AgeController.text.isNotEmpty
                              &&value.PlaceController.text.isNotEmpty){
                            if (value.addUsersImg != null) {
                              value.addCustomers();
                              back(context);
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                backgroundColor: Colors.red,
                                content: Center(
                                  child: Text(
                                      "Please Upload Profile Image",
                                      style: TextStyle(color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w800,)),
                                ),
                                duration:
                                Duration(milliseconds: 3000),
                              ));
                            }
                          }else{
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(
                              backgroundColor: Colors.red,
                              content: Center(
                                child: Text(
                                    "Please Fill All Details",
                                    style: TextStyle(color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w800,)),
                              ),
                              duration:
                              Duration(milliseconds: 3000),
                            ));
                          }

                        }

                             // callNextReplacement(context, LoginScreen());
                          },
                          child: Container(
                            height: 57,
                            width: 147,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 2,
                                      color: Colors.grey,
                                      offset: Offset(0, 3)),
                                ],
                                borderRadius: BorderRadius.circular(30),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xff3D9698).withOpacity(0.5),
                                      Color(0xff0996A9).withOpacity(0.6)
                                    ])),
                            child: Center(
                                child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )
                            ),
                          ),
                        );
                      }
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height/15,
              ),
              InkWell(onTap: (){
                callNextReplacement(context, LoginScreen());
              },
                child: Container(width: width,
                  height: height / 5,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/Vector 6 (6).png"),
                          fit: BoxFit.cover)),
                  child: Row(
                    children: [
                      SizedBox(width: width/6,),
                      Text("Already have an account?",style: TextStyle(fontSize: 15,color: Color(0xff047E8F)),),
                      GestureDetector(onTap: (){
                        callNextReplacement(context, LoginScreen());
                      },
                          child: Text("Login Now",style: TextStyle(fontSize: 15,color: Color(0xff785E19)))),
                    ],
                  ),
                ),
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
                    mainprovider.UsersgetImagecamera(), Navigator.pop(context)
                  }),
              ListTile(
                  leading:  Icon(Icons.photo, color: Colors.green),
                  title: const Text('Gallery',),
                  onTap: () => {
                    mainprovider.UsersgetImagegallery(),Navigator.pop(context)
                  }),
            ],
          );
        });
    // ImageSource
  }
}
