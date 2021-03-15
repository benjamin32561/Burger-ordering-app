import 'package:flutter/material.dart';
import 'package:willis/Services/auth.dart';
import 'textField.dart';

const email_regx = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
const password_regx = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,12}$';
const phone_regx = r'^(?:05)?[0-9]{10}$';
const name_regx = r'^[a-zA-Z ]{1,}$';

class SignupScreen extends StatefulWidget
{
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>
{
  Map<String, TextEditingController> controllers = {
    "email" : TextEditingController(),
    "password" : TextEditingController(),
    "password_conf" : TextEditingController(),
    "first_name" : TextEditingController(),
    "last_name" : TextEditingController(),
  };
  var scaffold_key = new GlobalKey<ScaffoldState>();

  void validateData()
  {
    if (!RegExp(email_regx).hasMatch(controllers["email"].text))
      buildSnack("Email is invalid!");
    else if (controllers["password"].text.length < 8 || controllers["password"].text.length > 12)
      buildSnack("Password is too short!");
    else if(!RegExp(password_regx).hasMatch(controllers["password"].text))
      buildSnack("Password must contain at least one letter and one number");
    else if(controllers["password"].text != controllers["password_conf"].text)
      buildSnack("Password confirmation is incorrect");
    else if(!RegExp(name_regx).hasMatch(controllers["first_name"].text))
      buildSnack("First name is invalid");
    else if(!RegExp(name_regx).hasMatch(controllers["last_name"].text))
      buildSnack("Last name is invalid");
    else
    {
      AuthService ac = AuthService();
      Map<String, String> to_send = {
        "email" : null,
        "password" : null,
        "password_conf" : null,
        "first_name" : null,
        "last_name" : null,
      };
      controllers.forEach((key, value) {
        to_send[key] = value.text;
      });
      //ac.signupEmailPass(to_send);
    }
  }

  void buildSnack(String _data)
  {
    // ignore: deprecated_member_use
    scaffold_key.currentState.showSnackBar(
    SnackBar(
        content: Text(_data,
           textAlign: TextAlign.center,
        ),
      )
    );

  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      key: scaffold_key,
      backgroundColor: Colors.redAccent[200],
      body:Container(
        padding: EdgeInsets.only(top: 50.0),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextInput("Email", false, TextInputType.emailAddress, controllers["email"]),
            TextInput("Password 8-12 characters", true, TextInputType.visiblePassword, controllers["password"]),
            TextInput("Confirm Password", true, TextInputType.visiblePassword, controllers["password_conf"]),
            TextInput("First Name", false, TextInputType.name, controllers["first_name"]),
            TextInput("Last Name", false, TextInputType.name, controllers["last_name"]),
            Flexible(
              child : Container(
                width: MediaQuery.of(context).size.width / 1.75,
                child: ElevatedButton(
                  onPressed: validateData,
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
            ),
          ],
        ),
      ),
    );
  }
}