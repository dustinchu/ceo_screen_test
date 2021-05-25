import 'package:ecocore_screen_test/common/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BluetoothListCard extends StatelessWidget {
  const BluetoothListCard({Key key, this.result, this.callback})
      : super(key: key);

  final ScanResult result;
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: const EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.only(left: 20, right: 20),
        height:60,

        // decoration: BoxDecoration(
        //   color: wBackground,
        //   boxShadow: [
        //     BoxShadow(
        //         color: Colors.black26, blurRadius: 4.0, offset: Offset(2, 2))
        //   ],
        // ),
        child: Column(
          children: [
            Row(
              children: [
                Text("${result.rssi}", style: wFontBoldH4),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Text("${result.device.name}", style: wFontBoldH4)),
                IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_right_outlined,
                      color: wBlue2,
                    ),
                    onPressed: callback)
              ],
            ),
            new Divider(
              height: 2,
              color: wBlue2,
            )
          ],
        ));
  }
}
