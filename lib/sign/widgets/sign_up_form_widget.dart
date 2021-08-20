import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({Key? key}) : super(key: key);
  @override
  SignUpFormWidgetState createState() {
    return SignUpFormWidgetState();
  }
}

class SignUpFormWidgetState extends State<SignUpFormWidget> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
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
          decoration: buildInputDecoration('Name *'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          textInputAction: TextInputAction.next,
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
        ),
        TextFormField(
          decoration: buildInputDecoration('Email *'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          textInputAction: TextInputAction.next,
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
        ),
        TextFormField(
          decoration: buildInputDecoration('Password *'),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          textInputAction: TextInputAction.next,
          obscureText: true,
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
        ),
        TextFormField(
          decoration: buildInputDecoration('Password Confirmation *'),
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
            text: "Aready have an account? ",
            children: <TextSpan>[
              TextSpan(
                  text: 'click here ',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print('The button is clicked!');
                    },
                  style: TextStyle(
                    color: Colors.blue,
                  )),
              TextSpan(text: 'and sign in!'),
            ],
          )),
        ),
        generateFormButton(
            content: "Sign Up",
            onPressed: () {
              print("logged");
            }),
        generateFormButton(
            content: "About",
            icon: Icons.info,
            onPressed: () {
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
      {required String content,
      IconData? icon,
      required final void Function() onPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          minimumSize: const Size(double.infinity, 30),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: icon != null
                  ? Icon(
                      icon,
                      color: Colors.white,
                    )
                  : null,
            ),
            Text(content)
          ],
        ),
      ),
    );
  }
}
