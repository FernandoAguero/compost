import 'package:flutter/material.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  static const String routeName = "/home";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // leading: InkWell(
          //     onTap: () {
          //       Navigator.pop(context); // pops out of the current context stack but has weird interaction with prefs
          //     },
          //     child: Icon(Icons.arrow_back_ios, color: Colors.black54)),
          //iconTheme: IconThemeData(color: Colors.black),
          title: Text("Home"),
        ),
        body: Center(
            child: Container(
          padding: const EdgeInsets.all(8),
          //color: Colors.blue,
          width: 100,
          height: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.blue, Colors.green]),
              color: Colors.blue,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey)]),
          child: Text("Hi flutter"),
        )));
  }
}
