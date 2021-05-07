
import 'package:ecocore_screen_test/widget/logo_circle.dart';
import 'package:flutter/material.dart';

import '../../common/style/colors.dart';

// ignore: must_be_immutable
class WelcomeLogo extends StatelessWidget {
  WelcomeLogo(
      {Key key,
      @required this.w,
      @required this.h,
      @required this.textSize,
      @required this.circleCount})
      : super(key: key);
  double w;
  double h;
  double textSize;
  int circleCount;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      height: h,
      child: Stack(
        children: [
          Center(
            child: CustomPaint(
                painter: DrawCircle(w: w, h: h, circleCount: circleCount)),
          ),
          Center(
            child: Text(
              "Ecocore",
              style: TextStyle(color: wLogoarial, fontSize: textSize),
            ),
          )
        ],
      ),
    );
  }
}

