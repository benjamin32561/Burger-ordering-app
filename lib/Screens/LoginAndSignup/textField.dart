import 'package:flutter/material.dart';

const email_regx = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
const password_regx = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,12}$';
const phone_regx = r'^(?:05)?[0-9]{10}$';
const name_regx = r'^[a-zA-Z ]{1,}$';

// ignore: must_be_immutable
class TextInput extends StatelessWidget
{
  String label;
  bool hide;
  TextInputType keyType;
  TextEditingController my_control;

  TextInput(this.label, this.hide, this.keyType, this.my_control);

  @override
  Widget build(BuildContext context)
  {
    return Flexible(
      child :Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 15.0),
        child: TextFormField(
          controller: my_control,
          obscureText: hide,
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.black38,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(),
            labelStyle: TextStyle(
              fontSize: 24.0,
              color: Colors.black38,
            ),
            labelText: label,
          ),
        ),
      ),
    );
  }
}