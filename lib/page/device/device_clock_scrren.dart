import 'package:ecocore_screen_test/common/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

// ignore: must_be_immutable
class DeviceClockScreen extends StatelessWidget {
   DeviceClockScreen({Key key,@required this.switchCallBack,@required this.name,@required this.status}) : super(key: key);
  ValueChanged<bool> switchCallBack;
  String name;
  bool status;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: wFontH2,
        ),
        SizedBox(
          width: 20,
        ),
        FlutterSwitch(
          toggleColor: wBlue2,
          activeColor: Colors.transparent,
          inactiveColor: Colors.transparent,
          activeToggleColor: Colors.white,
          activeSwitchBorder: Border.all(color: wSwitch),
          inactiveSwitchBorder: Border.all(color: wSwitch),
          width: 60.0,
          height: 30.0,
          padding: 0,
          value: status,
          onToggle: switchCallBack,
          // onToggle: (val) {
          //   setState(() {
          //     clockSwitch = val;
          //   });
          // },
        ),
      ],
    );
  }
}
