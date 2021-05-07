import 'package:flutter/material.dart';
import 'dart:io';

class OrherLoginIcon extends StatelessWidget {
  OrherLoginIcon(
      {Key key,
      @required this.appleClick,
      @required this.googleClick,
      @required this.facebookClick})
      : super(key: key);
  VoidCallback appleClick;
  VoidCallback facebookClick;
  VoidCallback googleClick;
  @override
  Widget build(BuildContext context) {
    Widget img(String path, VoidCallback click) {
      return InkWell(
        onTap: click,
        child: Container(
          // margin: EdgeInsets.only(right: 20),
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(path),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }

    List<Widget> appleOrherLogin = [
      img("assets/icon/facebook.png", facebookClick),
      img("assets/icon/google.png", googleClick),
      img("assets/icon/apple.png", appleClick)
    ];
    List<Widget> androidOrherLogin = [
      img("assets/icon/facebook.png", facebookClick),
      img("assets/icon/google.png", googleClick),
    ];
    return Container(
      margin: EdgeInsets.symmetric(vertical: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: Platform.isIOS ?appleOrherLogin :androidOrherLogin
      ),
    );
  }
}
