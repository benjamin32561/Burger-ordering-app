import 'package:flutter/material.dart';

const email_exp = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
const password_exp = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z!@#$%&\d]{8,12}$';
const name_exp = r'^[a-zA-Z ]{1,}$';
const phone_exp = r'^(?:05)?[0-9]{10}$';

OutlineInputBorder outLine(Color color, double radius)
{
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius),
    borderSide: BorderSide(
      color: color,
    )
  );
}

TextStyle textStyle(Color color, double font)
{
  return TextStyle(
    color: color,
    fontSize: font,
  );
}

InputDecoration inputDecoration(String text)
{
  return InputDecoration(
    border: outLine(Colors.black45, 20.0),
    focusedBorder: outLine(Colors.black45, 20.0),
    errorBorder: outLine(Colors.redAccent, 20.0),
    labelStyle: textStyle(Colors.black45, 22),
    labelText: text,
  );
}

class Burger extends StatefulWidget
{
  Burger({Key key}) : super(key: key);
  @override
  _BurgerState createState() => _BurgerState();
}

class _BurgerState extends State<Burger>
{
  MediaQueryData queryData;
  bool selected = false;

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
              value: selected,
              onChanged: (val){
                setState(() {
                  selected = val;
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