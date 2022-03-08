import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:smart_plantation/core/core.dart';
import 'package:smart_plantation/home/home_page.dart';
import 'package:http/http.dart' as http;

class GoogleButtonWidget extends StatelessWidget {
  const GoogleButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SignInButton(
                Buttons.Google,
                text: "Sign up with Google",
                onPressed: () {
                  _onPressed(context);
                },
                padding: EdgeInsets.symmetric(vertical: 10),
                // minimumSize: const Size(double.infinity, 30),]
              )),
        ),
      ],
    );
  }

  Future<String?> signInwithGoogle() async {}

  Future<void> _onPressed(BuildContext context) async {
    try {
      // await FirebaseAuth.instance.signOut();
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      UserCredential crd =
          await FirebaseAuth.instance.signInWithCredential(credential);
      String idToken = await crd.user!.getIdToken();
      var url = Uri.parse(AppConfig.apiUrl + "/api/auth");
      var response = await http.post(url, body: {'idToken': idToken});
      Map parsed = json.decode(response.body);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      print(e.message);
      // throw e;
    }
  }
}
