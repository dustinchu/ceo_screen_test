import 'dart:math';
import 'dart:ui';

import 'package:ecocore_screen_test/common/style/colors.dart';
import 'package:ecocore_screen_test/page/device/device_title_appbar.dart';
import 'package:ecocore_screen_test/widget/arrow_back.dart';
import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

import 'chart_widget/device_chart.dart';
import 'device_display.dart';
import 'device_menu.dart';
import 'device_switch.dart';

class DeviceScreen extends StatefulWidget {
  DeviceScreen({Key key}) : super(key: key);

  @override
  _DeviceScreenState createState() => _DeviceScreenState();
}

bool showBottomMenu = false;

class _DeviceScreenState extends State<DeviceScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey globalKey = GlobalKey();
    VoidCallback arrowClick() {}
    VoidCallback deviceSwitchTop() {}
    VoidCallback deviceSwitchLedf() {}
    VoidCallback deviceSwitchRight() {}
    VoidCallback deviceSwitchBottom() {}
    VoidCallback displayClock() {}
    VoidCallback displayPower() {}
    void _onVerticalSwipe(SwipeDirection direction) {
      setState(() {
        if (direction == SwipeDirection.up) {
          print("up");
          setState(() {
            showBottomMenu = true;
          });
        } else {
          print("down");
          setState(() {
            showBottomMenu = false;
          });
        }
      });
    }

    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    double threshold = 100;
    return Scaffold(
      backgroundColor: wBackground,
      body: SafeArea(
          child: Stack(
        children: [
          Column(
            children: [
              DeviceTitleAppbar(arrowClick: arrowClick, todayCost: "314.02"),
              DeviceChart(
                chartH: maxHeight > 800 ? 150 : 100,
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                // iphone6 要縮小一點
                width:  maxHeight > 800 ?maxWidth - 60:maxWidth - 70,
                height: maxHeight > 800 ?maxWidth - 60:maxWidth - 70,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: new BoxDecoration(
                  color: wLogoarial,
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                child: Stack(
                  children: [
                    //上下左右開關燈
                    DeviceSwitch(
                      alignment: Alignment.topCenter,
                      switchClick: deviceSwitchTop,
                      directionIsVertical: true,
                      onColor: wSwitch,
                      isOnOff: false,
                    ),
                    DeviceSwitch(
                      alignment: Alignment.bottomCenter,
                      switchClick: deviceSwitchBottom,
                      directionIsVertical: true,
                      onColor: wSwitch,
                      isOnOff: true,
                    ),
                    DeviceSwitch(
                      alignment: Alignment.centerLeft,
                      switchClick: deviceSwitchBottom,
                      directionIsVertical: false,
                      onColor: wSwitch,
                      isOnOff: true,
                    ),
                    DeviceSwitch(
                      alignment: Alignment.centerRight,
                      switchClick: deviceSwitchBottom,
                      directionIsVertical: false,
                      onColor: wSwitch,
                      isOnOff: true,
                    ),
                    LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 30),
                          decoration: new BoxDecoration(
                            color: wBlue4,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                          ),
                          child: Center(
                            child: DeviceDisplay(
                              w: constraints.maxWidth - 25,
                              h: constraints.maxWidth - 25,
                              name: "落地燈",
                              ntd: "123.05",
                              clockCallback: displayClock,
                              powerCallback: displayPower,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60,),
              Expanded(
                child: Container(),
              ),
            ],
          ),

          AnimatedPositioned(
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 200),
              left: 0,
               bottom: (showBottomMenu)?-60:-(maxHeight/3),
              child: SimpleGestureDetector(
                  onVerticalSwipe: _onVerticalSwipe, child: MenuWidget()))
        ],
      )),
    );
  }
}
