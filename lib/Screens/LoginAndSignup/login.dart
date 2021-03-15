import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:willis/Screens/LoginAndSignup/signup.dart';
import 'textField.dart';
import 'signup.dart';

class LoginScreen extends StatelessWidget
{
  Map<String, TextEditingController> controllers = {
  "email" : TextEditingController(),
  "password" : TextEditingController(),
  };

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Colors.redAccent[200],
      body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextInput("Email", false, TextInputType.emailAddress, controllers["email"]),
            TextInput("Password", true, TextInputType.visiblePassword, controllers["password"]),
            Container(
              width: MediaQuery.of(context).size.width / 1.75,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black45),
                ),
                child: Text("Login",
                  style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.75,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black45),
                ),
                child: Text("Signup",
                  style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}