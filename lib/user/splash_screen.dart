import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:niram/constants/call_functions.dart';
import 'package:niram/user/login_screen.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer( Duration(seconds: 5), () {
      callNextReplacement(context, LoginScreen());

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(

        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/niram_lcon.png",),scale: 3
                )),

      ),
    );
  }
}
