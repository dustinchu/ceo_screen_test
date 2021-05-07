import 'dart:math' as math;

import '../../widget/btn.dart';
import 'package:flutter/material.dart';

import '../../common/style/colors.dart';
import 'welcome_logo.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void loginClick() {}
    void registered() {}
    return Scaffold(
      backgroundColor: wBackground,
      body: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Container()),
            WelcomeLogo(
              textSize: 34,
              w: 250,
              h: 250,
              circleCount: 50,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "打造美好的用電生活",
              style: wFontBoldH2,
            ),
            Expanded(child: Container()),
            Btn(
              click: loginClick,
              textStyle: wFontBoldH3,
              text: "登入",
              w: 250,
            ),
            SizedBox(
              height: 10,
            ),
            Btn(
              click: registered,
              textStyle: wFontBoldH3,
              text: "註冊",
              w: 250,
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
