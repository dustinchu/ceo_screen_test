import 'package:ecocore_screen_test/common/style/colors.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
class DrawCircle extends CustomPainter {
  DrawCircle({@required this.w, @required this.h, @required this.circleCount});
  double w;
  double h;
  int circleCount;
  //線初始值 線寬顏色
  Paint _linePaint = Paint()
    ..style = PaintingStyle.fill
    ..isAntiAlias = true
    ..color = wCircle
    ..strokeWidth = 2;


  final int lineHeight = 20;

  @override
  void paint(Canvas canvas, Size size) {
    //園半徑
    double _bigRadius = math.min(w / 3, h / 3);
    //畫出刻度，，但是由於每畫一條刻度線之後，畫布都會旋轉60°（轉為弧度2 * pi / 60），所以畫出60條刻度線
    //-半徑讓他從頂部開始畫
    for (int i = 0; i < circleCount; i++) {
      canvas.drawLine(Offset(0, -_bigRadius + -lineHeight),
          Offset(0, -_bigRadius), _linePaint);

      canvas.rotate(math.pi / 360 * 10); //2*math.pi/60

    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}