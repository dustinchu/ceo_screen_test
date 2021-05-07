import 'package:ecocore_screen_test/common/style/colors.dart';
import 'package:flutter/material.dart';

class DialogLine extends StatelessWidget {
  const DialogLine({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      height: 2,
      width: double.infinity,
      color: wLine,
    );
  }
}
