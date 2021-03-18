import 'package:flutter/material.dart';
import 'Screens/wrapper.dart';
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

