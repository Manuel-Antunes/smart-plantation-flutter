import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smart_plantation/core/app_config.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  late FirebaseAuth _firebaseAuth;

  UserRepository() {
    _firebaseAuth = FirebaseAuth.instance;
  }

  signIn(String email, String password) async {
    UserCredential credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    String idToken = await credential.user!.getIdToken();
    var url = Uri.parse(AppConfig.apiUrl + "/api/auth");
    var response = await http.post(url, body: {'idToken': idToken});
    Map parsed = json.decode(response.body);
  }

  signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    UserCredential crd = await _firebaseAuth.signInWithCredential(credential);
    String idToken = await crd.user!.getIdToken();
    var url = Uri.parse(AppConfig.apiUrl + "/api/auth");
    var response = await http.post(url, body: {'idToken': idToken});
    Map parsed = json.decode(response.body);
  }

  create(
      {required String email,
      required String password,
      required String name,
      String photoUrl = ""}) async {
    var url = Uri.parse(AppConfig.apiUrl + "/api/user");
    await http.post(url, body: {});
  }

  getCurrentUser() async {
    return _firebaseAuth.currentUser!;
  }

  signOut() async {
    await _firebaseAuth.signOut();
  }
}
