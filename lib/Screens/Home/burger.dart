import 'package:flutter/material.dart';
import 'package:willis/Models/burgerModel.dart';

class Burger extends StatefulWidget
{
  BurgerData data;
  Burger(this.data);

  @override
  _BurgerState createState() => _BurgerState(data.key);
}

class _BurgerState extends State<Burger>
{
  BurgerData data;
  MediaQueryData queryData;
  _BurgerState(Key k) {data = BurgerData(k);}


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
      margin: EdgeInsets.only(top: queryData.size.height*0.03, bottom: queryData.size.height*0.03, left: queryData.size.width*0.05, right: queryData.size.width*0.05),
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