import 'package:flutter/material.dart';
import 'package:organic_basket/core/auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String _email;

  String _password;

  _save() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      Authentication.login(
          context: context, email: _email, password: _password);
    }
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: mq.height * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Login to your\naccount',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Welcome back!',
                style: TextStyle(fontSize: 25),
              ),
            ),
            SizedBox(
              height: mq.height * 0.1,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  buildEmailField(),
                  buildPasswordField(),
                ],
              ),
            ),
            SizedBox(
              height: mq.height * 0.14,
            ),
            buildLoginButton(mq),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'OR',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.grey),
                ),
              ),
            ),
            buildLoginGoogleButton(mq),
            buildSignUpButton(context),
          ],
        ),
      ),
    );
  }

  Widget buildEmailField() {
    return Container(
      padding: EdgeInsets.all(20),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Email',
          prefixIcon: Icon(
            Icons.email,
            color: Colors.grey,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
        onSaved: (value) {
          _email = value;
        },
      ),
    );
  }

  Widget buildPasswordField() {
    return Container(
      padding: EdgeInsets.all(20),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Password',
          prefixIcon: Icon(
            Icons.vpn_key,
            color: Colors.grey,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
        onSaved: (value) {
          _password = value;
        },
      ),
    );
  }

  Widget buildLoginButton(Size mq) {
    return Center(
      child: SizedBox(
        height: mq.height * 0.07,
        width: mq.width * 0.8,
        child: ElevatedButton(
          onPressed: _save,
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          ),
          child: Text(
            'Log in',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget buildLoginGoogleButton(Size mq) {
    return Center(
      child: SizedBox(
        height: mq.height * 0.07,
        width: mq.width * 0.8,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: Colors.white10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 40,
                width: 40,
                child: Image.asset('assets/images/google.png'),
              ),
              Text(
                'Log in with Google',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSignUpButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don\'t have an account?'),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('./signup-screen');
          },
          child: Text(
            'Sign up',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
