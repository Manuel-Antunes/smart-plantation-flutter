import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smart_plantation/about/about_page.dart';
import 'package:smart_plantation/home/home_page.dart';
import 'package:smart_plantation/sign/sign_up_page.dart';
import 'package:smart_plantation/sign/widgets/google_button_widget.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({Key? key}) : super(key: key);
  @override
  LoginFormWidgetState createState() {
    return LoginFormWidgetState();
  }
}

class LoginFormWidgetState extends State<LoginFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: buildFormControllers(),
        ),
      ),
    );
  }

  Column buildFormControllers() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          decoration: buildInputDecoration('Email *'),
          controller: _controllerEmail,
          validator: _validateEmail,
          textInputAction: TextInputAction.next, // Moves focus to next.
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20),
        ),
        TextFormField(
          decoration: buildInputDecoration('Password *'),
          style: const TextStyle(fontSize: 20.0),
          controller: _controllerPass,
          validator: _validatePassword,
          obscureText: true,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 10),
          child: RichText(
              text: TextSpan(
            text: "Don't have an account yet? ",
            children: <TextSpan>[
              TextSpan(
                  text: 'click here ',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpPage(),
                        ),
                      );
                    },
                  style: const TextStyle(
                    color: Colors.blue,
                  )),
              const TextSpan(text: 'and sign up!'),
            ],
          )),
        ),
        generateFormButton("Login", Icons.login, onSubmit),
        generateFormButton("About", Icons.info, () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AboutPage()),
          );
        }),
        const GoogleButtonWidget()
      ],
    );
  }

  String? _validatePassword(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  String? _validateEmail(value) {
    if (value.isEmpty) {
      return 'Please enter some text';
    }
    if (!RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value)) {
      return 'Invalid Email';
    }
    return null;
  }

  Future<void> onSubmit() async {
    try {
      bool valid = _formKey.currentState!.validate();
      if (!valid) {
        return;
      }
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _controllerEmail.value.text,
              password: _controllerPass.value.text);
      String idToken = await credential.user!.getIdToken();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Authentication Error"),
      ));
    }
  }

  InputDecoration buildInputDecoration(String labelText) {
    return InputDecoration(
      fillColor: Colors.white,
      labelText: labelText,
      filled: true,
    );
  }

  Padding generateFormButton(
      String content, IconData icon, final void Function() onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15),
          minimumSize: const Size(double.infinity, 30),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
            Text(content)
          ],
        ),
      ),
    );
  }
}
