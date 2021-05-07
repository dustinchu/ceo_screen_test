import 'package:ecocore_screen_test/common/style/colors.dart';
import 'package:ecocore_screen_test/common/style/padding.dart';
import 'package:flutter/material.dart';

import 'home_listview_card.dart';
import 'home_title_message.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);
  void addClick() {}

  @override
  Widget build(BuildContext context) {
    List<Widget> listviewDemo = <Widget>[
      HomeListviewCard(
          switchOnOff: false,
          name: "廚房",
          imgName: "dinningroom",
          ntd: "121.55"),
      HomeListviewCard(
          switchOnOff: true,
          name: "竹北的工作室",
          imgName: "computerroom",
          ntd: "123.55"),
      HomeListviewCard(
          switchOnOff: true,
          name: "工作室",
          imgName: "computerroom",
          ntd: "123.55"),
      HomeListviewCard(
          switchOnOff: true,
          name: "工作室",
          imgName: "computerroom",
          ntd: "123.55"),
      HomeListviewCard(
          switchOnOff: true,
          name: "工作室",
          imgName: "computerroom",
          ntd: "123.55"),
      HomeListviewCard(
          switchOnOff: true,
          name: "工作室",
          imgName: "computerroom",
          ntd: "123.55"),
    ];
    return Scaffold(
      backgroundColor: wBackground,
      body: Column(
        children: [
          Stack(
            children: [
              homeTitle(),
              HomeTitleMessage(),
            ],
          ),
          useText(),
          // help(),
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: ListView.builder(
              padding: EdgeInsets.only(top: 0),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return listviewDemo[index];
              },
              itemCount: listviewDemo.length,
            ),
          )),
        ],
      ),
    );
  }

  Widget help() {
    return Expanded(
      child: Padding(
        padding:const EdgeInsets.symmetric(horizontal: 30),
        child: Align(
          alignment: Alignment.center,
          child: Row(
            children: [
              new Image.asset("assets/icon/home_help_icon.png"),
              Expanded(child: Container()),
              Text("尚未有裝置\n可以按右上角的＋\n新增裝置\n開始體驗", style: wFontH3)
            ],
          ),
        ),
      ),
    );
  }

  Widget useText() {
    return Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Text(
          "使用中裝置",
          style: wFontH4,
        ));
  }

  Widget homeTitle() {
    return Container(
      height: 200,
      width: double.infinity,
      color: wBlue4,
      child: Column(
        children: [
          Container(
            height: 160,
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Row(
              children: [
                Text(
                  "Ecocre",
                  style: wFontH1,
                ),
                Expanded(
                  child: Container(),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: addClick,
                    child: new Image.asset("assets/icon/home_add.png"),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
