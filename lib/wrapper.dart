import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_20/auth/sign_in.dart';


import 'package:flutter_application_20/auth/homepage.dart';
import 'package:flutter_application_20/auth/sign_up.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    if (user != null) {
      return HomePage();
    } else {
      return Signup();
    }
  }
}
// StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, snapshot) {
//           if (snapshot.data == null) return Signin();
//           return Signup();
//         });
//     return Wrapper();