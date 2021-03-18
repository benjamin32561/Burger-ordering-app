import 'package:flutter/material.dart';
import 'package:willis/Models/burgerModel.dart';

class Burger extends StatefulWidget
{
  BurgerData data;
  Burger({data});
  @override
  _BurgerState createState() => _BurgerState(data: data);
}

class _BurgerState extends State<Burger>
{
  BurgerData data;
  MediaQueryData queryData;
  _BurgerState({data});
  @override
  Widget build(BuildContext context)
  {
    queryData = MediaQuery.of(context);
    return Container(
        decoration: BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.circular(25.0),
        ),
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: queryData.size.height*0.06, left: queryData.size.width*0.05, right: queryData.size.width*0.05),
        height: queryData.size.height*0.3,
        child: Column(
          children: [
            Container(
              alignment: Alignment.topRight,
              child: Checkbox(
                checkColor: Colors.white,
                activeColor: Colors.red,
                value: data.selected,
                onChanged: (val){
                  setState(() {
                    data.selected = val;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.greenAccent,
                            activeColor: Colors.red,
                            value: false,
                          ),
                          Text("ארוחה",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ]
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.greenAccent,
                            activeColor: Colors.red,
                            value: false,
                          ),
                          Text("ארוחה",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ]
                    ),
                  ],
                ),
              ],
            ),
          ],
        )
    );
  }
}