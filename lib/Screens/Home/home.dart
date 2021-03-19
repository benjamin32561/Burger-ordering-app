import 'dart:collection';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:willis/Models/burgerModel.dart';
import 'package:willis/Screens/Home/burger.dart';

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
  int id = 0;
  List<BurgerData> burgers = null;

  @override
  Widget build(BuildContext context)
  {
    queryData = MediaQuery.of(context);
    List<Widget> show = [];
    if (burgers != null)
    {
      for (int i = 0; i < burgers.length; i++)
        show.add(Burger(burgers[i]));
    }
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(
          children: [
            TextButton(
              onPressed: (){
                FirebaseAuth.instance.signOut();
              },
              child: Text(
                "Signout",
                style: textStyle(Colors.black54, 20.0),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(17),
          ),
        ),
        title: Container(
          padding: EdgeInsets.only(right: queryData.size.width*0.5, left: queryData.size.width*0.3),
          child: Icon(
            Icons.beach_access,
          ),
        ),
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
                    onPressed: (){
                      if (burgers != null)
                      {
                        List<BurgerData> temp = [];
                        for (int i = 0; i < burgers.length; i++)
                        {
                          if (!burgers[i].selected) temp.add(burgers[i]);
                        }
                        print(temp[0].key.toString());
                        setState(() => burgers = temp);
                      }
                    },
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
                      BurgerData bd = new BurgerData(ValueKey(id));
                      if (burgers == null) burgers = [bd];
                      else burgers.insert(0, bd);
                      setState(() => id++);
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
          children: show,
        ),
      ),
    );
  }
}
