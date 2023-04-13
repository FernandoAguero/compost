import 'package:compost/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  //Widets, material or cupertino apps as parameter
  runApp(MaterialApp(
    home: LoginPage(),
    theme: ThemeData(
      primarySwatch: Colors.green,
    ),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
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
