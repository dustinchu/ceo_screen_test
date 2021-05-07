import 'package:ecocore_screen_test/common/style/colors.dart';
import 'package:ecocore_screen_test/widget/logo_circle.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DeviceDisplay extends StatelessWidget {
  DeviceDisplay({
    Key key,
    @required this.clockCallback,
    @required this.powerCallback,
    @required this.ntd,
    @required this.name,
    @required this.w,
    @required this.h,
  }) : super(key: key);
  VoidCallback clockCallback;
  VoidCallback powerCallback;
  String ntd;
  String name;
  double w;
  double h;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: CustomPaint(painter: DrawCircle(w: w, h: h, circleCount: 50)),
        ),
        Center(
          child: Container(
              padding: EdgeInsets.only(top: 20),
              width: w * 0.6,
              height: h * 0.6,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: wBlue1,
              ),
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      name,
                      style: wFontH3,
                    ),
                  ),
                  Text(
                    "NTD.",
                    style: wFontH3,
                  ),
                  Expanded(flex: 1, child: Text(ntd, style: wFontBoldH1)),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DisplayIcon(
                          callback: clockCallback,
                          h: 40,
                          w: 40,
                          displayIcon: Icons.alarm,
                          iconColor: wIcon,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        DisplayIcon(
                          callback: powerCallback,
                          h: 40,
                          w: 40,
                          displayIcon: Icons.power_settings_new,
                          iconColor: wSwitch,
                        )
                      ],
                    ),
                  )
                ],
              )),
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class DisplayIcon extends StatelessWidget {
  DisplayIcon(
      {Key key,
      @required this.callback,
      @required this.w,
      @required this.h,
      @required this.displayIcon,
      @required this.iconColor})
      : super(key: key);
  VoidCallback callback;
  double w;
  double h;
  IconData displayIcon;
  Color iconColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: wBlue4,
        ),
        child: Icon(displayIcon, color: iconColor),
      ),
    );
  }
}
