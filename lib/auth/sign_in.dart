import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_20/helper/firebase_helper.dart';
import 'package:flutter_application_20/auth/homepage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sign in'),
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
              onPressed: () async {
                var emailaddress = _emailController.text;
                var password = _passController.text;
                var obj =
                    Firebasehelper().Signin(emailaddress, password, context);
                // final SharedPreferences sharedPreferences =
                //     await SharedPreferences.getInstance();
                // sharedPreferences.setString('email', _emailController.text);
                // Get.to(HomePage());

                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.setString("email", emailaddress);
                
              },
              child: Text('Sign in'),
            )
          ],
        ),
      ),
    );
  }
}
