import 'package:ecocore_screen_test/common/style/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeListviewCard extends StatelessWidget {
  HomeListviewCard(
      {Key key,
      @required this.switchOnOff,
      @required this.name,
      @required this.ntd,
      @required this.imgName})
      : super(key: key);
  bool switchOnOff;
  String name;
  String ntd;
  String imgName;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      margin: EdgeInsets.only(bottom:15),
      width: double.infinity,
      height: 80,
      decoration: new BoxDecoration(
        color: wBlue4,
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 20),
            width: 5,
            height: 54,
            decoration: new BoxDecoration(
              color: switchOnOff ? wSwitch : wBlue3,
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
          ),
          Image.asset("assets/device/$imgName.png"),
          Container(
            width: 50,
            margin: EdgeInsets.only(left: 20,right: 20),
            child: Text(
              name,
              style: wFontBoldH3,
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            height: 23,
            child: Text(
              "NTD.",
              style: wFontBoldH4,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            ntd,
            style: wFontBoldH2,
          ),
        ],
      ),
    );
  }
}
