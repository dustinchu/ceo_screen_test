import 'package:flutter/material.dart';

import 'bluetooth_screen.dart';

class TestHomeScreen extends StatelessWidget {
  const TestHomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text("12312313123"),
            Text("12312313123"),
            Text("12312313123"),
            Text("12312313123"),
            Text("12312313123"),
            TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (ctx) => BluetoothScreen()).then((value) {
                    print("dialog colse");
                  });
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (context) {
                  //   return BluetoothScreen();
                  // }));
                },
                child: Text("next"))
          ],
        ),
      ),
    );
  }
}
