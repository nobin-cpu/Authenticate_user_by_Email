import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_20/auth/homepage.dart';
import 'package:flutter_application_20/auth/sign_in.dart';
import 'package:flutter_application_20/auth/sign_up.dart';
import 'package:flutter_application_20/auth/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_20/helper/firebase_helper.dart';
import 'package:flutter_application_20/wrapper.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/change_notifier_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "your key",
        appId: "your key",
        messagingSenderId: "your key",
        projectId: "your key",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString("email");
  print(email);
  runApp(MaterialApp(
 routes: {
        'signin': (context) => Signin(),
        'signup': (context) => Signup(),
        'homepage': (context) => HomePage(),
        'splash': (context) => SplashScreen()
      },

    debugShowCheckedModeBanner: false,
    home: email == null ? Signup() : HomePage(),
  ));
}

