import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget
{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.redAccent[200],
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Center(
          child: Text("Willi's"),
        )
      ),
    );
  }
}
