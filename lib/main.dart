import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Screens/home.dart';
import 'Screens/LoginAndSignup/login.dart';
import 'Screens/LoginAndSignup/signup.dart';
import 'package:firebase_core/firebase_core.dart';

void main()
{
  runApp(App());
}

class App extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return MaterialApp(
      home: Wrapper(),
    );
  }
}

class Wrapper extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    //returns widget based on authentication
    Widget to_ret = LoginScreen();
    return to_ret;
  }
}
