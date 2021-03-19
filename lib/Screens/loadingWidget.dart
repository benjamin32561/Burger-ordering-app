import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingAnimation extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Container(
      child: Center(
        child: Container(
          color: Colors.white,
          child: SpinKitChasingDots(
            color: Colors.redAccent,
            size: 50.0,
          ),
        ),
      ),
    );
  }
}
