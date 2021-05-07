import 'package:ecocore_screen_test/common/style/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DeviceSwitch extends StatelessWidget {
  DeviceSwitch(
      {Key key,
      @required this.alignment,
      @required this.directionIsVertical,
      @required this.switchClick,
      @required this.onColor,
      @required this.isOnOff})
      : super(key: key);
  Alignment alignment;
  bool directionIsVertical;
  VoidCallback switchClick;
  bool isOnOff;
  Color onColor;
  @override
  Widget build(BuildContext context) {
    //關閉的顏色
    Decoration isOffDecoration = BoxDecoration(
      color: wBlue3,
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
    );
    //打開模糊顏色
    Decoration isOnDecoration = BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        boxShadow: [
          BoxShadow(
            color: onColor,
            blurRadius: 1.5,
            spreadRadius: 0.0,
            offset: Offset(
              0.0,
              2.0,
            ),
          ),
        ]);
    
    Widget vertical = Container(
        margin: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
        height: 10,
        decoration: new BoxDecoration(
          color: wBlue3,
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ));
    Widget horizontal = Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 60),
        width: 10,
        decoration: isOnOff ? isOnDecoration : isOffDecoration);

    return InkWell(
      onTap: switchClick,
      child: Align(
        alignment: alignment,
        child: directionIsVertical ? vertical : horizontal,
      ),
    );
  }
}
