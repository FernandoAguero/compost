import 'package:compost/pages/home_page.dart';
import 'package:compost/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:compost/utils/constants.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //singleton
  Constants.prefs = await SharedPreferences.getInstance();
  //Widets, material or cupertino apps as parameter
  // runApp(MaterialApp(
  //     home: LoginPage(),
  //     theme: ThemeData(
  //       primarySwatch: Colors.green,
  //     ),
  //     routes: {
  //       LoginPage.routeName: (context) => LoginPage(),
  //       HomePage.routeName: (context) => HomePage()
  //     }));
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Constants.prefs.getBool("loggedIn") == false // false to get out
            ? HomePage()
            : LoginPage(),
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        routes: {
          LoginPage.routeName: (context) => LoginPage(),
          HomePage.routeName: (context) => HomePage()
        });
  }
}
