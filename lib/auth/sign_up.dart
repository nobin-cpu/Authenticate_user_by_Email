import 'package:flutter/material.dart';
import 'package:flutter_application_20/auth/sign_in.dart';
import 'package:flutter_application_20/helper/firebase_helper.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sign up'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  hintText: 'Enter email'),
            ),
            SizedBox(
              height: 10,
            ), 
            TextField(
              controller: _passController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  hintText: 'Enter password'),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  var email = _emailController.text;
                  var password = _passController.text;
                 Firebasehelper().Signup(email, password, context);
                },
                child: Text('Sign up')),
            TextButton(
                onPressed: () {
                 Navigator.of(context).pushReplacementNamed('signin');
                },
                child: Text('Already has account? sign in'))
          ],
        ),
      ),
    );
  }
}
