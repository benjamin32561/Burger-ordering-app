import 'package:flutter/material.dart';
import 'package:willis/Screens/LoginSignup/signup.dart';
import 'package:willis/Services/auth.dart';
import 'package:willis/loadingWidget.dart';
import '../../helpers.dart';

class LoginScreen extends StatefulWidget
{
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
{
  TextEditingController _email_controller = TextEditingController();
  TextEditingController _password_controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  MediaQueryData queryData;
  bool loading = false;

  @override
  Widget build(BuildContext context)
  {
    queryData = MediaQuery.of(context);
    return loading ? LoadingAnimation(""):Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: queryData.size.height*0.3),
        child: Form(
          key: _formKey,
          child: ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(left: queryData.size.width * 0.1, right: queryData.size.width * 0.1),
            children: [
              Container(
                padding: EdgeInsets.only(bottom: queryData.size.height*0.03),
                child: TextFormField(
                  validator: (val){
                    return RegExp(email_exp).hasMatch(val)? null:"Email address is incorrect";
                  },
                  decoration: inputDecoration("Email"),
                  controller: _email_controller,
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: queryData.size.height*0.03),
                child: TextFormField(
                    obscureText: true,
                  decoration: inputDecoration("Password"),
                  controller: _password_controller,
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: queryData.size.height*0.01,
                left: queryData.size.height*0.08,
                right: queryData.size.height*0.08),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text("Login"),
                  onPressed: () async {
                    if (_formKey.currentState.validate())
                    {
                      setState(()=> loading = true);
                      AuthService ac = AuthService();
                      final user = await ac.signinEmailPassword(_email_controller.text, _password_controller.text);
                      if (user == null)
                      {
                        setState(()=> loading = false);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              "Invalid email or password",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                    }
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: queryData.size.height*0.01,
                    left: queryData.size.height*0.08,
                    right: queryData.size.height*0.08),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text("Signup"),
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),);
                  },
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
