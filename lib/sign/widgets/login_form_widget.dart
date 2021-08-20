import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smart_plantation/home/home_page.dart';
import 'package:smart_plantation/sign/sign_up_page.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({Key? key}) : super(key: key);
  @override
  LoginFormWidgetState createState() {
    return LoginFormWidgetState();
  }
}

class LoginFormWidgetState extends State<LoginFormWidget> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          textInputAction: TextInputAction.next, // Moves focus to next.
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
        ),
        TextFormField(
          decoration: buildInputDecoration('Password *'),
          style: TextStyle(fontSize: 20.0),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
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
        generateFormButton("Login", Icons.login, () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        }),
        generateFormButton("About", Icons.info, () {
          print("aboutting");
        }),
      ],
    );
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
