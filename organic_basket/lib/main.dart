import 'package:flutter/material.dart';
import 'package:organic_basket/screens/categories_screen.dart';

import './screens/login_screen.dart';
import './screens/signup_screen.dart';
import './screens/tabs_screen.dart';
import './screens/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabsScreen(),
      routes: {
        './welcome-screen': (ctx) => WelcomeScreen(),
        './login-screen': (ctx) => LoginScreen(),
        './signup-screen': (ctx) => SignUpScreen(),
        './categories-screen': (ctx) => CategoriesScreen(),
      },
    );
  }
}
