import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../helpers.dart';

class HomeScreen extends StatefulWidget
{
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
  MediaQueryData queryData;
  int toPay = 0;
  int i = 0;
  List<Widget> burgers = null;
  List<Widget> show = null;

  @override
  Widget build(BuildContext context)
  {
    queryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(17),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.beach_access,
            )
          ],
        )
      ),
      floatingActionButton: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: queryData.size.width*0.075),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton(
                    backgroundColor: Colors.redAccent,
                    child: Icon(Icons.remove),
                  ),
                  Container(
                    width: queryData.size.width*0.3,
                    child: FloatingActionButton(
                      backgroundColor: Colors.redAccent,
                      child: Text(
                        "Order now",
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.redAccent,
                    child: Icon(Icons.add),
                    onPressed: () {
                      if (burgers == null)
                      {
                        burgers = [Burger(key: ValueKey(i),)];
                      }
                      else
                      {
                        burgers.insert(0, Burger(key: ValueKey(i),));
                      }
                      setState(() {
                        i++;
                        show = burgers;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: ListView(
          children: show == null? []:show,
        ),
      ),
    );
  }
}
