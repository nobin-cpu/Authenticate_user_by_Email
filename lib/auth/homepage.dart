import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_20/auth/sign_in.dart';
import 'package:flutter_application_20/helper/firebase_helper.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController address = TextEditingController();
  final Firebasehelper _auth = Firebasehelper();
  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.signOut();
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    Future<void> addUser() {
      return users.add({
        'first_name': firstname.text,
        'last_name': lastname.text,
        'address': address.text,
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("fire store"),
      ),
      body: Column(
        children: [
          TextField(
            controller: firstname,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: 'name'),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: lastname,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: 'last name'),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: address,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: 'address'),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                addUser();
              },
              child: Text('click me')),
          ElevatedButton(
              onPressed: () async {
                final SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.remove('email');
                Navigator.of(context).popAndPushNamed('signup');
              },
              child: Text('sign out'))
        ],
      ),
    );
  }
}
