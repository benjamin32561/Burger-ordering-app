import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:willis/Services/auth.dart';
import 'Screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget
{

  @override
  Widget build(BuildContext context)
  {
    Firebase.initializeApp();
    return StreamProvider.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

