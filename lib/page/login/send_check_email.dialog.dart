import 'dart:async';

import 'package:ecocore_screen_test/common/style/colors.dart';
import 'package:ecocore_screen_test/widget/btn.dart';
import 'package:ecocore_screen_test/widget/dialog_line.dart';
import 'package:ecocore_screen_test/widget/login_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SendCheckEmailDialog extends StatefulWidget {
  @override
  _SendCheckEmailDialogState createState() => _SendCheckEmailDialogState();
}

class _SendCheckEmailDialogState extends State<SendCheckEmailDialog> {
  bool timeStart = false;
  int time = 15;
  var period = const Duration(seconds: 1);

  @override
  void initState() {
    super.initState();
    timeEvent();
  }

  void timeEvent() {
    timeStart = true;
    Timer.periodic(period, (timer) {
      if (time == 0) {
        timer.cancel();
        timer = null;
        timeStart = false;
      } else {
        time--;
      }
      //避免視窗不存在還繼續setState
      if (!mounted) return;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    void checkClick() {
      if (time == 0) {
        time = 15;
        print("time=$time");
        timeEvent();
      }
      // Navigator.pop(context);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Material(
          color: Colors.transparent,
          child: Row(children: [
            Container(
                margin: EdgeInsets.only(left: 20, top: 20, bottom: 60),
                child: Text("註冊確認", style: wFontH1))
          ]),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(20),
                decoration: new BoxDecoration(
                  color: wDialogBackground,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  //设置四周边框
                ),
                height: 260,
                child: Material(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        Text(
                          "請至註冊信箱獲取認證連結，\n以完成註冊程序。",
                          textAlign: TextAlign.center,
                          style: wFontH4,
                        ),
                        DialogLine(),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            time == 0 ? "\n可重發認證連結" : "$time  秒後\n可重發認證連結",
                            textAlign: TextAlign.center,
                            style: wFontH4,
                          ),
                        ),
                        Btn(
                            w: 120,
                            textStyle: wFontBoldH3,
                            text: "重發認證連結",
                            click: checkClick)
                      ],
                    )),
              ),
            )
          ],
        )
      ],
    );
  }
}
