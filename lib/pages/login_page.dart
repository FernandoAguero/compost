import 'package:flutter/material.dart';

class LoginPage {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends LoginPage {
  final formkey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
      body: SingleChildScrollView(
          child: Form(
        key: formkey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _usernameController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: "Enter email", labelText: "Usuario"),
            ),
            TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter password",
                labelText: "Password",
              ),
            )
          ],
        ),
      )),
    );
  }
}
