import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
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
                'Create your\naccount',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Join Us!!',
                style: TextStyle(fontSize: 25),
              ),
            ),
            SizedBox(
              height: mq.height * 0.08,
            ),
            buildNameField(),
            buildEmailField(),
            buildPasswordField(),
            SizedBox(
              height: mq.height * 0.08,
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

  Widget buildNameField() {
    return Container(
      padding: EdgeInsets.all(20),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Name',
          prefixIcon: Icon(
            Icons.person,
            color: Colors.grey,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
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
      ),
    );
  }

  Widget buildLoginButton(Size mq) {
    return Center(
      child: SizedBox(
        height: mq.height * 0.07,
        width: mq.width * 0.8,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          ),
          child: Text(
            'Sign up',
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
                'Sign up with Google',
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
        Text('Already have an account?'),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('./login-screen');
          },
          child: Text(
            'Sign in',
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
