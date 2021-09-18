import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:organic_basket/core/firebase_methods.dart';
import 'package:organic_basket/core/store.dart';

import '../screens/tabs_screen.dart';

final auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

class Authentication {
  static Future<void> signUp(
      {BuildContext context,
      String name,
      String email,
      String password}) async {
    try {
      ToggleLoading();

      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User user = userCredential.user;

      if (user != null) {
        ToggleLoading();

        FirebaseMethods.saveUserToFirebase(
            uid: user.uid, name: name, email: email);

        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (ctx) => TabsScreen()));
      }
    } catch (error) {
      print(error);

      var errorMessage = 'Failed! Try again Later';
      if (error.toString().contains('ERROR_TOO_MANY_REQUESTS')) {
        errorMessage = 'Too many requests. Try again Later!';
      } else if (error.toString().contains('email address is already in use')) {
        errorMessage = 'User Already Registered';
      } else if (error
          .toString()
          .contains('Password should be at least 6 characters')) {
        errorMessage = 'Password too short';
      } else if (error.toString().contains('A network error')) {
        errorMessage = 'Network error';
      }

      ToggleLoading();

      Fluttertoast.showToast(
        msg: errorMessage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  static Future<void> login(
      {BuildContext context, String email, String password}) async {
    try {
      ToggleLoading();

      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      User user = userCredential.user;

      if (user != null) {
        ToggleLoading();
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (ctx) => TabsScreen()));
      }
    } catch (error) {
      print(error);

      var errorMessage = 'Failed! Try again Later';
      if (error.toString().contains('password is invalid')) {
        errorMessage = 'Opps! Wrong Password';
      } else if (error.toString().contains('ERROR_TOO_MANY_REQUESTS')) {
        errorMessage = 'Too many requests. Try again Later!';
      } else if (error.toString().contains('no user record corresponding')) {
        errorMessage = 'User not Registered';
      } else if (error.toString().contains('A network error')) {
        errorMessage = 'Network error';
      }

      ToggleLoading();

      Fluttertoast.showToast(
        msg: errorMessage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  static Future<void> SignOut() async {
    await auth.signOut();
  }

  static void signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential authResult =
          await auth.signInWithCredential(credential);

      final User user = authResult.user;

      if (user != null) {
        FirebaseMethods.saveUserToFirebase(
            uid: user.uid, name: user.displayName, email: user.email);

        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (ctx) => TabsScreen()));
      }
    } catch (error) {
      print(error);
      Fluttertoast.showToast(
        msg: error.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  static void signOutGoogle() async {
    await googleSignIn.signOut();
    await auth.signOut();
  }
}
