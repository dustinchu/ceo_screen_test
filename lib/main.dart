import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'common/util/screen.dart';
import 'page/device/device_screen.dart';
import 'page/login/login_screen.dart';
import 'page/login/registered_screen.dart';
import 'page/router/IndexPage.dart';
import 'page/welcome/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IndexPage(),
    );
  }
}
