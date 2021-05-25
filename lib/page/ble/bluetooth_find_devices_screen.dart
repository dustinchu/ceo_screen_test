import 'dart:ui';

import 'package:ecocore_screen_test/common/style/colors.dart';
import 'package:ecocore_screen_test/widget/btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

import 'appbar.dart';
import 'bluetooth_connect.dart';
import 'bluetooth_list_card.dart';

class BluetoothFindDevicesScreen extends StatefulWidget {
  BluetoothFindDevicesScreen({Key key}) : super(key: key);

  @override
  _BluetoothFindDevicesScreen createState() => _BluetoothFindDevicesScreen();
}

class _BluetoothFindDevicesScreen extends State<BluetoothFindDevicesScreen> {
  @override
  void initState() {
    super.initState();
    FlutterBlue.instance.startScan();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // ArrowAppbar(
        //   text: "藍芽",
        //   onPressed: () {
        //     FlutterBlue.instance.stopScan();
        //     Navigator.pop(context, true);
        //   },
        // ),
        SizedBox(
          height: 30,
        ),
        Text(
          "新增裝置時 請離設備距離近一點",
          style: wFontBoldH4,
        ),
        Text(
          "以防設定到一半錯誤",
          style: wFontBoldH4,
        ),
        Container(
          height: 500,
          margin: EdgeInsets.symmetric(horizontal: 50),
          decoration: new BoxDecoration(
            color: wDialogBackground,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            //设置四周边框
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "已搜尋到的裝置",
                  style: wFontBoldH4,
                ),
              ),
              Expanded(
                child: StreamBuilder<List<ScanResult>>(
                    stream: FlutterBlue.instance.scanResults,
                    initialData: [],
                    builder: (c, snapshot) => ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            if (snapshot.data[index].device.name != '')
                              return Material(
                                child: BluetoothListCard(
                                  result: snapshot.data[index],
                                  callback: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      snapshot.data[index].device.connect();
                                      return BluetoothConnect(
                                          device: snapshot.data[index].device);
                                    }));
                                  },
                                ),
                              );
                            return Container();
                          },
                        )
                    // Column(
                    // children: snapshot.data
                    // .map(
                    //   (r) => BluetoothListCard(
                    //     result: r,
                    //     // onTap: () => Navigator.of(context)
                    //     //     .push(MaterialPageRoute(builder: (context) {
                    //     //   r.device.connect();
                    //     //   return SensorPage(device: r.device);
                    //     // })),
                    //   ),
                    // )
                    // .toList(),
                    ),
              ),
              Container(
                width: double.infinity,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Btn(
                        w: 100,
                        click: () {},
                        text: "加入裝置",
                        textStyle: wBtnFontBoldH4,
                      ),
                    ),
                    Positioned(
                      child: Text("略過",style: wFontH5,),
                      right: 0,
                      bottom: 0,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ],
    );
  }
}
