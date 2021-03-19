import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:willis/Services/auth.dart';

class VerifyEmailScreen extends StatelessWidget
{
  MediaQueryData queryData;

  @override
  Widget build(BuildContext context)
  {
    queryData = MediaQuery.of(context);
    return Container(
      child: Center(
        child: Container(
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.only(top: queryData.size.height*0.4),
            child: Column(
              children: [
                SpinKitChasingDots(
                  color: Colors.redAccent,
                  size: 50.0,
                ),
                Container(
                  padding: EdgeInsets.only(left: queryData.size.height*0.05,
                      right: queryData.size.height*0.05,
                      top: queryData.size.height*0.03,
                      bottom: queryData.size.height*0.03),
                  child: Text(
                    "Please verify your email, A verification email was sent to you",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 18.0,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                      ),
                    ),
                  onPressed: (){
                    //AuthService().verifyEmail();
                  },
                  child: Text("Resend Email"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
