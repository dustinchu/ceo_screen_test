import 'package:flutter/material.dart';

import '../common/style/colors.dart';

// ignore: must_be_immutable
class Btn extends StatelessWidget {
  Btn(
      {Key key,
      @required this.w,
      @required this.textStyle,
      @required this.text,
      @required this.click})
      : super(key: key);
  VoidCallback click;
  double w;
  TextStyle textStyle;
  String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: click,
        style: ElevatedButton.styleFrom(
          primary: wBlue4,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(15.0),
          ),
        ),
        child: Container(
            width: w,
            alignment: Alignment.center,
            child: Text(
              text,
              style: textStyle,
            )));
  }
}
