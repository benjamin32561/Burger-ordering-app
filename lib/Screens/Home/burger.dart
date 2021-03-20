import 'package:flutter/material.dart';
import 'package:willis/Models/burgerModel.dart';

import '../../helpers.dart';

class Burger extends StatefulWidget
{
  BurgerData data;
  Burger(this.data);

  @override
  _BurgerState createState() => _BurgerState();
}

class _BurgerState extends State<Burger>
{
  MediaQueryData queryData;

  @override
  Widget build(BuildContext context)
  {
    queryData = MediaQuery.of(context);
    return Container(
      key: ValueKey(this.widget.data.id),
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(25.0),
      ),
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: queryData.size.height*0.03, bottom: queryData.size.height*0.03, left: queryData.size.width*0.05, right: queryData.size.width*0.05),
      height: queryData.size.height*0.35,
      child: Row(
        children: [
          Container(
            height: queryData.size.height*0.35,
            width: queryData.size.width*0.75,
            padding: EdgeInsets.only(left: queryData.size.width*0.1),
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              childAspectRatio: 3,
              physics: BouncingScrollPhysics(),
              children: [
                Container(),
                hebrewText("כללי", 16),
                buildCheckBoxWithText("מטורלל", "crazy"),
                buildCheckBoxWithText("ארוחה", "meal"),
                buildCheckBoxWithText("צ'יפס", "fries"),
                buildCheckBoxWithText("קולה", "cola"),
                Container(),
                hebrewText("מעל", 16),
                buildCheckBoxWithText("אסאדו", "asado"),
                buildCheckBoxWithText("גבינה", "cheese"),
                Container(),
                buildCheckBoxWithText("ריבת בצל", "onion_jam"),
                Container(),
                hebrewText("בפנים", 16),
                buildCheckBoxWithText("חסה", "lades"),
                buildCheckBoxWithText("עגבנייה", "tomato"),
                buildCheckBoxWithText("בצל", "onion"),
                buildCheckBoxWithText("חמוצים", "pickles"),
              ],
            ),
          ),
          Checkbox(
            checkColor: Colors.white,
            activeColor: Colors.red,
            value: widget.data.info["selected"],
            onChanged: (val){setState(() => widget.data.info["selected"] = val);},
          ),
        ],
      ),
    );
  }

  Widget buildCheckBoxWithText(String text, String place)
  {
    return Row(
      children: [
        Checkbox(
          checkColor: Colors.white,
          activeColor: Colors.red,
          value: widget.data.info[place],
          onChanged: (val){setState(() => widget.data.info[place] = val);},
        ),
        hebrewText(text, 14)
      ]
    );
  }

  Widget hebrewText(String text, double font)
  {
    return Text(text,
      textDirection: TextDirection.rtl,
      style: textStyle(Colors.white, font),
    );
  }
}