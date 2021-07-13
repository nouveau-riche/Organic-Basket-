import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:organic_basket/core/store.dart';
import 'package:organic_basket/screens/categories_screen.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:firebase_core/firebase_core.dart';

import './screens/login_screen.dart';
import './screens/signup_screen.dart';
import './screens/tabs_screen.dart';
import './screens/welcome_screen.dart';

void main() async {
  await Firebase.initializeApp();

  runApp(
    VxState(store: MyStore(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser == null
          ? WelcomeScreen()
          : TabsScreen(),
      routes: {
        './welcome-screen': (ctx) => WelcomeScreen(),
        './login-screen': (ctx) => LoginScreen(),
        './signup-screen': (ctx) => SignUpScreen(),
        './categories-screen': (ctx) => CategoriesScreen(),
      },
    );
  }
}
