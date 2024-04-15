import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:niram/constants/call_functions.dart';
import 'package:niram/provider/loginProvider.dart';
import 'package:niram/provider/main_provider.dart';
import 'package:niram/user/Register_screen.dart';
import 'package:niram/user/otp_screen.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../constants/refactoring.dart';
enum MobileVarificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  MobileVarificationState currentSate = MobileVarificationState.SHOW_MOBILE_FORM_STATE;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  bool showTick = false;
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final FirebaseFirestore db = FirebaseFirestore.instance;
  late BuildContext context;
  String Code = "";
  late String verificationId;
  bool showLoading = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  bool otpPage = false;
  bool isHovering = false;

  Future<void> signInWithPhoneAuthCredential(BuildContext context, PhoneAuthCredential phoneAuthCredential) async {
    if (kDebugMode) {
      print('done 1  $phoneAuthCredential');
    }
    setState(() {
      showLoading = true;
    });
    try {
      final authCredential =
      await auth.signInWithCredential(phoneAuthCredential);
      if (kDebugMode) {
        print(' 1  $phoneAuthCredential');
      }
      setState(() {
        showLoading = false;
      });
      try {
        var LoginUser = authCredential.user;
        if (LoginUser != null) {
          LoginProvider loginProvider = LoginProvider();
          loginProvider.userAuthorized(LoginUser.phoneNumber, context);

          // callNextReplacement(AdminHomeScreen(), context);

          if (kDebugMode) {
            print("Login SUccess");

          }
        }
      } catch (e) {
        const snackBar = SnackBar(
          content: Text('Otp failed'),
          backgroundColor: Colors.black,
        );

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        print(e.toString());
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.black,
        content: Text(
          e.message ?? "",
        ),
      ));
    }
  }

  Widget getMobileFormWidget(context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    var width = queryData.size.width;
    var height = queryData.size.height;
    MainProvider mainProvider = Provider.of<MainProvider>(context,listen:false);
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(height: height,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // currentSate == MobileVarificationState.SHOW_MOBILE_FORM_STATE?
              Column(
                children: [
                  Container(
                    width: width,
                    height: height / 2.8,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/newone.png"),
                        fit: BoxFit.cover,
                      ),
                    ),),

                  const Text('Login',style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    letterSpacing: 0.5,
                    fontFamily: 'PoppinsMedium',
                    fontWeight: FontWeight.w700,
                  ),),
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 18, right: 18,top: 40),
                    child: Container(
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
                      height:height / 15,
                      width: width / 1.15,
                      child: TextFormField(
                        controller: phoneController,
                        onChanged: (value) {
                          if (value.length == 10) {
                            showTick = true;
                            SystemChannels.textInput
                                .invokeMethod('TextInput.hide');
                          } else {
                            showTick = false;
                          }

                          setState(() {});
                        },
                        style:  const TextStyle(color:  Colors.black,
                          fontSize: 20,
                          fontFamily: 'PoppinsRegular',
                          fontWeight: FontWeight.w100,),
                        autofocus: false,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [LengthLimitingTextInputFormatter(10)],
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          counterStyle: const TextStyle(color:Colors.grey),
                          hintStyle:   TextStyle(
                            color:  Colors.black.withOpacity(0.4000000059604645),
                            fontSize: 20,
                            fontFamily: 'PoppinsRegular',
                            fontWeight: FontWeight.w100,
                          ),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                          hintText: 'Mobile Number',
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(81),
                            borderSide:  const BorderSide(
                                color: Colors.white
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide:  const BorderSide(
                                color: Colors.white
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide:  const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: InkWell(
                      onTap: () async {
                        if(phoneController.text.length==10){
                          db.collection('USERS').where('Phone_Number',isEqualTo: "+91${phoneController.text}").get().then((value) async {
                            if(value.docs.isNotEmpty){
                              setState(() {
                                if (phoneController.text.length == 10) {
                                  showLoading = true;
                                }
                              });
                              await auth.verifyPhoneNumber(
                                  phoneNumber: "+91${phoneController.text}",
                                  verificationCompleted:
                                      (phoneAuthCredential) async {
                                    setState(() {
                                      showLoading = false;
                                    });
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text("Verification Completed"),
                                      duration: Duration(milliseconds: 3000),
                                    ));
                                    if (kDebugMode) {}
                                  },
                                  verificationFailed:
                                      (verificationFailed) async {
                                    setState(() {
                                      showLoading = false;
                                    });
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content:
                                      Text("Sorry, Verification Failed"),
                                      duration: Duration(milliseconds: 3000),
                                    ));
                                    if (kDebugMode) {
                                      print(verificationFailed.message.toString());
                                    }
                                  },
                                  codeSent:
                                      (verificationId, resendingToken) async {
                                    setState(() {
                                      showLoading = false;
                                      currentSate = MobileVarificationState
                                          .SHOW_OTP_FORM_STATE;
                                      this.verificationId = verificationId;

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text(
                                            "OTP sent to phone successfully"),
                                        duration:
                                        Duration(milliseconds: 3000),
                                      ));

                                      if (kDebugMode) {
                                        print("");
                                      }
                                    });
                                  },
                                  codeAutoRetrievalTimeout:
                                      (verificationId) async {});
                            }else{
                              const snackBar = SnackBar(
                                  backgroundColor: Colors.red,
                                  duration: Duration(milliseconds: 3000),
                                  content: Text("No user Found!",
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ));
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                          });
                        }else{
                          const snackBar = SnackBar(
                              backgroundColor: Colors.red,
                              duration: Duration(milliseconds: 3000),
                              content: Text("Please Enter a Valid Mobile Number",
                                textAlign: TextAlign.center,
                                softWrap: true,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }


                      },
                      child: showLoading
                          ?  const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: CircularProgressIndicator(
                            color: Colors.red,
                          )
                      )
                          :Container( width: width*0.35,
                        height: 50,
                        // width: 340,
                        margin: const EdgeInsets.symmetric(horizontal: 18,vertical: 20),
                        decoration:  const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.green, Colors.greenAccent,
                                ]
                            )
                        ),
                        child: const Center(
                          child: Text("Request OTP",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                fontFamily: "PoppinsMedium",
                                letterSpacing: 0.39
                            ),),
                        ),
                      ),
                    ),
                  ),
                  InkWell(onTap: (){
                    callNext(context, RegisterScreen());
                  },
                    child: Text('New User Registration',style: TextStyle(
                      decoration: TextDecoration.underline,color: Colors.blue
                    ),),
                  ),
                  SizedBox(height: height*0.08,),

                ],
              ),

              const SizedBox(height: 20,),

              SizedBox(height: height*0.1,)
            ],
          ),
        ),
      ),
    );
  }

  Widget getOtpFormWidget(context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    var width = queryData.size.width;
    var height = queryData.size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(height: height,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Column(
                children: [
                  Container(
                    width: width,
                    height: height / 2.8,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/newone.png"),
                        fit: BoxFit.cover,
                      ),
                    ),),
                  const Text('Login',style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    letterSpacing: 0.5,
                    fontFamily: 'PoppinsMedium',
                    fontWeight: FontWeight.w700,
                  ),),
                  const SizedBox(height: 20,),
                  SizedBox(width: width*0.5,
                    child: const Align( alignment:Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 65.0),
                        child: Text(
                          'Enter OTP',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'PoppinsRegular',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 25,
                            right: 25,
                            top: 30
                        ),
                        child: Container(width: width*0.9,
                          height: 60,
                          // color: Colors.redAccent,
                          child: PinFieldAutoFill(
                            codeLength: 6,
                            focusNode: _pinPutFocusNode,
                            keyboardType: TextInputType.number,
                            autoFocus: true,
                            controller: otpController,

                            currentCode: "",
                            // decoration: UnderlineDecoration(
                            //   colorBuilder: FixedColorBuilder(Colors.white)
                            // ),
                            decoration: BoxLooseDecoration(
                              bgColorBuilder: const FixedColorBuilder(Colors.white),
                              textStyle:  const TextStyle(
                                color: Colors.black,//Colors.black
                                fontSize: 20,
                                fontFamily: 'PoppinsRegular',
                                fontWeight: FontWeight.w600,
                                // height: 0,
                                ),
                              radius: const Radius.circular(5),
                              strokeColorBuilder:  FixedColorBuilder(Colors.blueAccent.withOpacity(0.5)),
                            ),
                            onCodeChanged: (pin) {
                              if (pin!.length == 6) {
                                PhoneAuthCredential phoneAuthCredential =
                                PhoneAuthProvider.credential(
                                    verificationId: verificationId,
                                    smsCode: pin);
                                signInWithPhoneAuthCredential(
                                    context, phoneAuthCredential);
                                otpController.text = pin;
                                setState(() {
                                  Code = pin;
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),

                  Container(
                    height: 60,
                    // width: 340
                    // w,
                    width: width*0.38,
                    margin: const EdgeInsets.symmetric(horizontal: 22,vertical: 30),
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF096FB2), Color(0xFF004675)
                            ]
                        ),
                        borderRadius: BorderRadius.circular(18)
                    ),
                    child: const Center(
                      child: Text("Submit",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            fontFamily: "PoppinsMedium",
                            letterSpacing: 0.39
                        ),),
                    ),
                  ),
                  showLoading
                      ? const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: CircularProgressIndicator(
                      color: Color(0xFF096FB2),
                    ),
                  )
                      : Container(),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return WillPopScope(

      onWillPop: () async => false,
      child: Scaffold(
          key: scaffoldKey,
          body: Container(
            child:
            currentSate == MobileVarificationState.SHOW_MOBILE_FORM_STATE
            // getMobileFormWidget
                ? getMobileFormWidget(context)
                : getOtpFormWidget(context),
          )),
    );

  }
}
