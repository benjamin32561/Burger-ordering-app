import 'package:flutter/material.dart';
import 'package:willis/Services/auth.dart';

import '../../helpers.dart';

class SignupScreen extends StatefulWidget
{
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>
{
  Map<String , TextEditingController> controllers = {
    "email": TextEditingController(),
    "password": TextEditingController(),
    "password_conf": TextEditingController(),
    "first_name": TextEditingController(),
    "last_name": TextEditingController(),
  };
  final _formKey = GlobalKey<FormState>();
  MediaQueryData queryData;

  @override
  Widget build(BuildContext context)
  {
    queryData = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: queryData.size.height * 0.13),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.only(left: queryData.size.width * 0.1, right: queryData.size.width * 0.1),
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    top: queryData.size.height * 0.01,
                    bottom: queryData.size.height * 0.024),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) {
                    return RegExp(email_exp).hasMatch(val) ? null : "Email address is incorrect";
                  },
                  decoration: inputDecoration("Email"),
                  controller: controllers["email"],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    bottom: queryData.size.height * 0.024),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  validator: (val) {
                    return RegExp(password_exp).hasMatch(val) ? null : "At least: 1 letter, 1 number";
                  },
                  decoration: inputDecoration("Password 8-12 characters"),
                  controller: controllers["password"],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    bottom: queryData.size.height * 0.024),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  validator: (val) {
                    return val == controllers["password"].text ? null : "Does not match password";
                  },
                  decoration: inputDecoration("Password confirmation"),
                  controller: controllers["password_conf"],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    bottom: queryData.size.height * 0.024),
                child: TextFormField(
                  validator: (val) {
                    return RegExp(name_exp).hasMatch(val) ? null : "Invalid first name";
                  },
                  decoration: inputDecoration("First name"),
                  controller: controllers["first_name"],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    bottom: queryData.size.height * 0.024),
                child: TextFormField(
                  validator: (val) {
                    return RegExp(name_exp).hasMatch(val) ? null : "Invalid last name";
                  },
                  decoration: inputDecoration("Last name"),
                  controller: controllers["last_name"],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  left: queryData.size.height * 0.07,
                  right: queryData.size.height * 0.07,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text("Signup"),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      Map<String, String> data = {
                        "email": null,
                        "password": null,
                        "password_conf": null,
                        "first_name": null,
                        "last_name": null,
                      };
                      controllers.forEach((key, value) {data[key] = value.text;});
                      AuthService ac = AuthService();
                      final user = null;//await ac.signupEmailPassword(data);
                      if (user == null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              "Error while creating user",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
