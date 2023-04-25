import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Login Page")),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Image.asset(
                "assets/images/logo.png",
                //fit: BoxFit.cover,
              ),
            ),
            Align(
              child: SingleChildScrollView(
                  child: Form(
                key: formkey,
                child: Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("Iniciar"),
                      )
                    ],
                  ),
                ),
              )),
            )
          ],
        ));
  }
}
