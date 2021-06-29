import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/tabs_screen.dart';

final auth = FirebaseAuth.instance;

class Authentication {
  static Future<void> signUp(
      {BuildContext context, String email, String password}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User user = userCredential.user;

      if (user != null) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (ctx) => TabsScreen()));
      }
    } catch (error) {
      print(error);
    }
  }

  static Future<void> login(
      {BuildContext context, String email, String password}) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      User user = userCredential.user;

      if (user != null) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (ctx) => TabsScreen()));
      }
    } catch (error) {
      print(error);

      // wrong password
    }
  }

  static Future<void> SignOut() async {
    await auth.signOut();
  }
}
