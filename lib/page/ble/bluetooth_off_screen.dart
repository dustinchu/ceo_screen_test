import 'package:ecocore_screen_test/common/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

import 'appbar.dart';

class BluetoothOffScreen extends StatelessWidget {
  const BluetoothOffScreen({Key key, this.state}) : super(key: key);

  final BluetoothState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      color: wBackground,
      child: Column(
        children: <Widget>[
          ArrowAppbar(
            text: "藍芽",
            onPressed: () => Navigator.pop(context, true),
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.bluetooth_disabled,
                  size: 200.0,
                  color: Colors.white54,
                ),
                Text(
                  '請到設定開啟藍芽 狀態：${state.toString().substring(15)}.',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .subhead
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
