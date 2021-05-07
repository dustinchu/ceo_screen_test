import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'sample10.dart';
import 'sample12.dart';
import 'sample13.dart';
import 'sample14.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // _onTap(BuildContext context, Widget widget) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (_) => Scaffold(
  //         appBar: AppBar(),
  //         body: widget,
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    return Scaffold(
      appBar: AppBar(
        title: Text("Bezier Chart Sample"),
      ),
      body: Sample14(),
    );
  }
}