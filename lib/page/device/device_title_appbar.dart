import 'package:ecocore_screen_test/common/style/colors.dart';
import 'package:ecocore_screen_test/widget/arrow_back.dart';
import 'package:flutter/material.dart';

import 'chart_widget/device_chart.dart';

// ignore: must_be_immutable
class DeviceTitleAppbar extends StatelessWidget {
  DeviceTitleAppbar(
      {Key key, @required this.arrowClick, @required this.todayCost})
      : super(key: key);
  VoidCallback arrowClick;
  String todayCost;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 30),
          child: Container(
            margin: EdgeInsets.only(
              left: 30,
              right: 30,
              // top: 20,
              // bottom: 30,
            ),
            child: ArrowBack(
              click: arrowClick,
              text: "客廳",
            ),
          ),
        ),
        Expanded(child: Container()),
        Container(
          margin: EdgeInsets.only(bottom: 12),
          child: Row(
            children: [
              Container(
                height: 34,
                width: 5,
                decoration: new BoxDecoration(
                  color: wSwitch,
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "今日花費",
                      style: wFontH4,
                    ),
                    Text(
                      todayCost,
                      style: wFontH4,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
