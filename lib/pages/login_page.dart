import 'package:compost/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../utils/auth.dart';
import '../utils/constants.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "/login";
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final bool _isLogin = false;

  handleSubmit() async {
    //Validate user inputs using _formKey
    if (_formKey.currentState!.validate()) {
      //Get inputs from the controllers
      final email = _emailController.value.text;
      final password = _passwordController.value.text;
      //Check if is login or register
      if (_isLogin) {
        await Auth().signInWithEmailAndPassword(email, password);
      } else {
        await Auth().registerWithEmailAndPassword(email, password);
      }
    }
  }

  handleSubmit2() async {
    //Validate user inputs using _formKey
    if (_formKey.currentState!.validate()) {
      //Get inputs from the controllers
      final email = _emailController.value.text;
      final password = _passwordController.value.text;

      await Auth().signInWithEmailAndPassword(email, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Colegio Científico")),
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
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "Enter email", labelText: "Email"),
                      ),
                      TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                        },
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
                          onPressed: handleSubmit,
                          child: Text(_isLogin ? 'Login' : 'Register')
                          // onPressed: () {

                          //   Constants.prefs.setBool("loggedIn", true);
                          //   // _formKey.currentState?.validate();
                          //   // Navigator.push(
                          //   //     context,
                          //   //     MaterialPageRoute(
                          //   //         builder: (context) => HomePage()));

                          //   //no chance of coming back to this screen
                          //   Navigator.pushReplacementNamed(
                          //       context, HomePage.routeName);

                          //   // Navigator.push(
                          //   //     context,
                          //   //     MaterialPageRoute(
                          //   //         builder: (context) => HomePage()));
                          // },
                          //child: const Text("Iniciar"),
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
