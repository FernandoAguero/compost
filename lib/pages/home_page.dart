import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../utils/constants.dart';
import 'login_page.dart';

/* class HomePage extends StatefulWidget {
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
} */

class HomePage extends StatefulWidget {
  static const String routeName = "/home";
  @override
  //State<HomePage> createState() => _HomePageState();
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    dateController.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Datepicker"),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Constants.prefs.setBool("loggedIn", false);
                  Navigator.pushReplacementNamed(context, LoginPage.routeName);
                  //Navigator.pop(_LoginPageState createState() => _LoginPageState())
                },
                icon: Icon(Icons.exit_to_app))
          ],
        ),
        body: Container(
            padding: const EdgeInsets.all(15),
            height: 150,
            child: Center(
                child: TextField(
              controller: dateController, //editing controller of this TextField
              decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_today), //icon of text field
                  labelText: "Enter Date" //label text of field
                  ),
              readOnly: true, // when true user cannot edit text
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(), //get today's date
                    firstDate: DateTime(
                        2000), //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2101));

                if (pickedDate != null) {
                  print(
                      pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                  String formattedDate = DateFormat('yyyy-MM-dd').format(
                      pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                  print(
                      formattedDate); //formatted date output using intl package =>  2022-07-04
                  //You can format date as per your need

                  setState(() {
                    dateController.text =
                        formattedDate; //set foratted date to TextField value.
                  });
                } else {
                  print("Date is not selected");
                }
              },
            ))));
  }
}
