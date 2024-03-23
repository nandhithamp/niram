import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:niram/constants/call_functions.dart';
import 'package:niram/user/home_screen.dart';
import 'package:pinput/pinput.dart';

import '../admin/admin_home.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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
                height: height / 3.5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/Vector 6 (7).png"),
                        fit: BoxFit.cover)),
                child:Column(
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
              SizedBox(height: height/15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child:Pinput(
                  length: 6,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  defaultPinTheme: PinTheme( decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    boxShadow: [BoxShadow(
                      blurRadius: 1,
                      offset: Offset(0, 1),
                      color: Colors.grey.shade600
                    )]
                  ),
                    textStyle: TextStyle(fontWeight: FontWeight.bold),
                    height: 50,
                    width: 50,
      
                  ),
      
                  onCompleted: (pin){
      
      
                  },
                ),
              ),
              SizedBox(height:height/50 ,),
              Text("Resend OTP in: 30 sec",style: TextStyle(color: Colors.grey,fontSize: 15),),
              SizedBox(height:height/100 ,),
              GestureDetector(
                onTap: (){
                  callNextReplacement(context, AdminHome());
                },
                child: Container(
                  height: 57,
                  width: 147,
                  decoration: BoxDecoration(boxShadow: [BoxShadow(blurRadius: 2,color: Colors.grey,offset: Offset(0, 3)),],
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xff3D9698).withOpacity(0.5), Color(0xff0996A9).withOpacity(0.6)])),
                  child:  Center(
                    child: Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                  ),
                ),
              ),
              Container(width: width,
                height: height / 2.4,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/Vector 6 (4).png"),
                        fit: BoxFit.cover)),


              ),
      
      

            ],
          ),
        ),
      
      ),
    );
  }
}
