import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:niram/provider/loginProvider.dart';
import 'package:niram/provider/main_provider.dart';
import 'package:niram/user/Register_screen.dart';
import 'package:niram/user/contest_screen.dart';
import 'package:niram/user/contestdetial_screen.dart';
import 'package:niram/user/login_screen.dart';
import 'package:niram/user/otp_screen.dart';
import 'package:niram/user/shortlisted_screen.dart';
import 'package:niram/user/splash_screen.dart';
import 'package:niram/user/winners_screen.dart';
import 'package:provider/provider.dart';

import 'admin/add_contest.dart';
import 'admin/admin_home.dart';
import 'admin/admins_screen.dart';
import 'admin/allcontests_screen.dart';
import 'admin/category_screen.dart';
import 'admin/contestdescription_screen.dart';
import 'admin/jury members_screen.dart';
import 'admin/participants_screen.dart';
import 'admin/participants_work.dart';
import 'admin/users_screen.dart';
import 'admin/winners_list.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainProvider(),),
        ChangeNotifierProvider(create: (context) => LoginProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(fontFamily: 'Amiko',

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:Splash(),
      ),
    );
  }
}

