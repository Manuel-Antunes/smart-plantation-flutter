import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smart_plantation/home/home_page.dart';
import 'package:smart_plantation/sign/login_page.dart';
import 'package:smart_plantation/sign/widgets/google_button_widget.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({Key? key}) : super(key: key);
  @override
  SignUpFormWidgetState createState() {
    return SignUpFormWidgetState();
  }
}

class SignUpFormWidgetState extends State<SignUpFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPass = TextEditingController();
  final TextEditingController _controllerConfirmPass = TextEditingController();

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
          controller: _controllerName,
          decoration: buildInputDecoration('Name *'),
          validator: _validateName,
          textInputAction: TextInputAction.next,
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
        ),
        TextFormField(
          decoration: buildInputDecoration('Email *'),
          controller: _controllerEmail,
          validator: _validateEmail,
          textInputAction: TextInputAction.next,
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
        ),
        TextFormField(
          decoration: buildInputDecoration('Password *'),
          controller: _controllerPass,
          validator: _validatePass,
          textInputAction: TextInputAction.next,
          obscureText: true,
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
        ),
        TextFormField(
          controller: _controllerConfirmPass,
          decoration: buildInputDecoration('Password Confirmation *'),
          validator: _validateConfirmPass,
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                  style: const TextStyle(
                    color: Colors.blue,
                  )),
              const TextSpan(text: 'and sign in!'),
            ],
          )),
        ),
        generateFormButton(content: "Sign Up", onPressed: onSubmit),
        generateFormButton(
            content: "About",
            icon: Icons.info,
            onPressed: () {
              print("aboutting");
            }),
        GoogleButtonWidget()
      ],
    );
  }

  Future<void> onSubmit() async {
    bool valid = _formKey.currentState!.validate();
    if (!valid) {
      return;
    }
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _controllerEmail.value.text,
              password: _controllerPass.value.text);
      await credential.user!.updateDisplayName(_controllerName.value.text);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Error While creating user"),
      ));
    }
  }

  String? _validateName(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  String? _validateEmail(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    if (!RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value)) {
      return 'Invalid Email';
    }
    return null;
  }

  String? _validatePass(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  String? _validateConfirmPass(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
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
