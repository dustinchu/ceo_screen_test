import 'package:ecocore_screen_test/common/style/colors.dart';
import 'package:flutter/material.dart';

class ArrowBack extends StatelessWidget {
  ArrowBack(
      {Key key,
      @required this.text,
      @required this.click,
      @required this.fonStyle})
      : super(key: key);
  VoidCallback click;
  String text;
  TextStyle fonStyle;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: click,
          child: Container(
            // margin: EdgeInsets.only(right: 20),
            width: 13,
            height: 25,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/icon/back.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          text,
          style: fonStyle,
        )
      ],
    );
  }
}
