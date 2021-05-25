import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

import 'bluetooth_find_devices_screen.dart';
import 'bluetooth_off_screen.dart';

class BluetoothScreen extends StatelessWidget {
  const BluetoothScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder<BluetoothState>(
          stream: FlutterBlue.instance.state,
          initialData: BluetoothState.unknown,
          builder: (c, snapshot) {
            final state = snapshot.data;
            if (state == BluetoothState.on) {
              return BluetoothFindDevicesScreen();
            }
            return BluetoothOffScreen(state: state);
          }
    );
  }
}
