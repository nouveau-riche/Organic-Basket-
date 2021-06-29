import 'package:flutter/material.dart';
import 'package:organic_basket/core/auth.dart';
import 'package:organic_basket/screens/welcome_screen.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Sign out'),
          onPressed: () {
            Authentication.SignOut().whenComplete(() {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (ctx) => WelcomeScreen()),
                  (route) => false);
            });
          },
        ),
      ),
    );
  }
}
