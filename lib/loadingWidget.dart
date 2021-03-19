import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'helpers.dart';

class LoadingAnimation extends StatelessWidget
{
  String text;
  LoadingAnimation(this.text);

  @override
  Widget build(BuildContext context)
  {
    return Container(
      child: Center(
        child: Container(
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.only(top: 50.0, left: 25.0, right: 25.0),
            alignment: Alignment.center,
            child: Column(
              children: [
                SpinKitChasingDots(
                  color: Colors.redAccent,
                  size: 50.0,
                ),
                Text(text,
                  style: textStyle(Colors.black45, 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
