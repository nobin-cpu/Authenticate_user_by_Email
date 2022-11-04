import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_20/auth/sign_in.dart';
import 'package:flutter_application_20/auth/homepage.dart';
import 'package:flutter_application_20/auth/sign_up.dart';

class Firebasehelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  get user => null;

  Signup(email, password, context) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      var authcredential = userCredential.user;
      if (authcredential!.uid.isNotEmpty) {
        Navigator.of(context).pushReplacementNamed('homepage');
      } else {
        print('sign in failed');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Signin(emailAddress, password, context) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      var idcredential = credential.user;

      if (idcredential!.uid.isNotEmpty) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
          return HomePage();
        }));
      } else {
        print('sign in failed');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
