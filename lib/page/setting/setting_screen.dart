import 'package:ecocore_screen_test/common/style/colors.dart';
import 'package:ecocore_screen_test/page/welcome/welcome_logo.dart';
import 'package:ecocore_screen_test/widget/logo_circle.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: wBackground,
      body: Container(
        child: Stack(
          children: [
            Center(
              child: CustomPaint(
                  painter: DrawCircle(w: 320, h: 320, circleCount: 50)),
            ),
            Center(
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: wBlue1,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "落地燈",
                        style: wFontH3,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "NTD.",
                        style: wFontH3,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("780.35", style: wFontBoldH1),
                         SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: wBlue4,
                            ),
                             child: Icon(Icons.alarm,color: wIcon,),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: wBlue4,
                            ),
                            child: Icon(Icons.power_settings_new,color:wSwitch),
                          )
                        ],
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
