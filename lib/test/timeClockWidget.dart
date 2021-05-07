// import 'dart:math' as math;
// import 'package:flutter/material.dart';

// import 'colors.dart';

// class WelcomeLogo extends CustomPainter {
//   WelcomeLogo({w, h, textSize, circleCount});
//   double w;
//   double h;
//   double textSize;
//   int circleCount;
//   //線初始值 線寬顏色
//   Paint _linePaint = Paint()
//     ..style = PaintingStyle.fill
//     ..isAntiAlias = true
//     ..color = wCircle
//     ..strokeWidth = 2;

//   final int lineHeight = 20;

//   @override
//   void paint(Canvas canvas, Size size) {
//     //園半徑
//     double _bigRadius = math.min(w / 3, h / 3);
//     //畫出刻度，，但是由於每畫一條刻度線之後，畫布都會旋轉60°（轉為弧度2 * pi / 60），所以畫出60條刻度線
//     //-半徑讓他從頂部開始畫
//     for (int i = 0; i < 30; i++) {
//       canvas.drawLine(Offset(0, -_bigRadius + -lineHeight),
//           Offset(0, -_bigRadius), _linePaint);

//       canvas.rotate(math.pi / 360 * 10); //2*math.pi/60
//     }

//     //文字畫筆
//     TextPainter _textPainter = new TextPainter(
//         textAlign: TextAlign.left, textDirection: TextDirection.ltr);

//     _textPainter.text = TextSpan(
//         style: new TextStyle(color: wLogoarial, fontSize: 22), text: "Ecocore");
//     // canvas.rotate(-deg2Rad(30) * i);//保持画数字的时候竖直显示。
//     _textPainter.layout();
//     _textPainter.paint(
//         canvas, Offset(-_textPainter.width / 2, -_textPainter.height / 2));
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     // TODO: implement shouldRepaint
//     return true;
//   }
// }
