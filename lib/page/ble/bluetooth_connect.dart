import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'dart:convert' show utf8;

class BluetoothConnect extends StatefulWidget {
  const BluetoothConnect({Key key, @required this.device}) : super(key: key);
  final BluetoothDevice device;
  @override
  _BluetoothConnectState createState() => _BluetoothConnectState();
}

class _BluetoothConnectState extends State<BluetoothConnect> {
  String serviceUUID = "4fafc201-1fb5-459e-8fcc-c5c9c331914b";
  String characteristicUUID = "beb5483e-36e1-4688-b7f5-ea07361b26a8";
  BluetoothCharacteristic targetCharacteristic;
  @override
  void initState() {
    super.initState();
    widget.device.state.listen((event) async {
      switch (event) {
        case BluetoothDeviceState.disconnected:
          print("blue===>disconnected");
          //如果斷線的話延遲五秒 連線
          await widget.device.connect();
          break;
        case BluetoothDeviceState.connecting:
          print("blue===>connecting");
          break;
        case BluetoothDeviceState.connected:
          print("blue===>connected");
          break;
        case BluetoothDeviceState.disconnecting:
          print("blue===>disconnecting");
          break;
      }
    });
    discoverService();
  }

  discoverService() async {
    print("??");
    List services = await widget.device.discoverServices();
    
    services.forEach((service) {
      print("UUID==${service.uuid.toString()}");
      if (service.uuid.toString() == serviceUUID) {
        service.characteristics.forEach((characteristic) {
          if (characteristic.uuid.toString() == characteristicUUID) {
            print("YYY$services");
            targetCharacteristic = characteristic;
            characteristic.setNotifyValue(!characteristic.isNotifying);
            //  characteristic.setNotifyValue(true);
            characteristic.value.listen((value) {
              // print("value===$value");
            });
          }
        });
      //   // }
      }
    });
  }

  void write() {
    List<int> bytes = utf8.encode("casd,0;");
    targetCharacteristic.write(bytes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                child: Text("back"),
                onTap: () {
                  widget.device.disconnect();
                  Navigator.of(context).pop();
                }),
            SizedBox(
              height: 123,
            ),
            IconButton(
              icon: Icon(Icons.ac_unit),
              onPressed: () {
                write();
              },
            ),
          ],
        ),
      ),
    );
  }
}
