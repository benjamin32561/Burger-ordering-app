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
