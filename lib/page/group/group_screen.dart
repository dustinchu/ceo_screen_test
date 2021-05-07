import 'package:ecocore_screen_test/widget/logo_circle.dart';
import 'package:flutter/material.dart';

import 'sparkline.dart';
// import 'package:flutter_sparkline/flutter_sparkline.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      child: Stack(
        children: [
          Center(
            child: CustomPaint(
                painter: DrawCircle(w: 250, h: 250, circleCount: 50)),
          ),
        ],
      ),
    );
  }
}
