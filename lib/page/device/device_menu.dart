import 'package:ecocore_screen_test/common/style/colors.dart';
import 'package:ecocore_screen_test/common/util/menu.dart';
import 'package:ecocore_screen_test/widget/search_textField.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatefulWidget {
  MenuWidget({Key key}) : super(key: key);

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  TextEditingController _searchController;
  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    // Call the dispose() method of the TextEditingController
    // here, and remember to do it before the super call, as
    // per official documentation:
    // https://api.flutter.dev/flutter/widgets/TextEditingController-class.html
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    int carSize = width > 400 ? 3 : 2;
    List<Menu> menuData = [
      // Menu(deviceName: "tt", imgName: "bedroom", safeIndex: 0),
      Menu(deviceName: "臥室1", imgName: "bedroom", safeIndex: 0),
      Menu(deviceName: "廚房2", imgName: "kitchen", safeIndex: 2),
      Menu(deviceName: "客廳3", imgName: "livingroom", safeIndex: 1),
      Menu(deviceName: "臥室4", imgName: "bedroom", safeIndex: 0),
      Menu(deviceName: "廚房5", imgName: "kitchen", safeIndex: 2),
      Menu(deviceName: "客廳6", imgName: "livingroom", safeIndex: 1),
      Menu(deviceName: "臥室7", imgName: "bedroom", safeIndex: 0),
      // Menu(deviceName: "廚房8", imgName: "kitchen", safeIndex: 2),
      // Menu(deviceName: "客廳9", imgName: "livingroom", safeIndex: 1),
      // Menu(deviceName: "臥室10", imgName: "bedroom", safeIndex: 0),
      // Menu(deviceName: "廚房11", imgName: "kitchen", safeIndex: 2),
      // Menu(deviceName: "客廳12", imgName: "livingroom", safeIndex: 1),
      // Menu(deviceName: "臥室13", imgName: "bedroom", safeIndex: 0),
      // Menu(deviceName: "廚房14", imgName: "kitchen", safeIndex: 2),
      // Menu(deviceName: "客廳15", imgName: "livingroom", safeIndex: 1),
    ];
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      child: Container(
        color: wBlue1,
        width: width,
        height: height / 3 + 60,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 20.0),
          child: Column(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: height / 5,
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  )),
              Search_textField(searchController:_searchController ,),
              Expanded(
                child: ListView(
                  children: [
                    //螢幕寬度>400  一行顯示3個
                    for (var i = 0; i < menuData.length ~/ carSize; i++)
                      carSize == 3
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MenuCard(
                                    imgName: menuData[i * 2 + i].imgName,
                                    deviceName: menuData[i * 2 + i].deviceName,
                                    safeColorIndex:
                                        menuData[i * 2 + i].safeIndex),
                                MenuCard(
                                    imgName: menuData[i * 2 + 1 + i].imgName,
                                    deviceName:
                                        menuData[i * 2 + 1 + i].deviceName,
                                    safeColorIndex:
                                        menuData[i * 2 + 1 + i].safeIndex),
                                MenuCard(
                                    imgName: menuData[i * 2 + 2 + i].imgName,
                                    deviceName:
                                        menuData[i * 2 + 2 + i].deviceName,
                                    safeColorIndex:
                                        menuData[i * 2 + 2 + i].safeIndex),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MenuCard(
                                    imgName: menuData[i * 2].imgName,
                                    deviceName: menuData[i * 2].deviceName,
                                    safeColorIndex: menuData[i * 2].safeIndex),
                                MenuCard(
                                    imgName: menuData[i * 2 + 1].imgName,
                                    deviceName: menuData[i * 2 + 1].deviceName,
                                    safeColorIndex:
                                        menuData[i * 2 + 1].safeIndex),
                              ],
                            ),
                    //一行三個 或兩個 最後餘數 額外顯示在最後一行
                    if (menuData.length % carSize == 1)
                      MediaQuery.of(context).size.width > 400
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                MenuCard(
                                    imgName:
                                        menuData[menuData.length - 1].imgName,
                                    deviceName: menuData[menuData.length - 1]
                                        .deviceName,
                                    safeColorIndex:
                                        menuData[menuData.length - 1]
                                            .safeIndex),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MenuCard(
                                    imgName:
                                        menuData[menuData.length - 1].imgName,
                                    deviceName: menuData[menuData.length - 1]
                                        .deviceName,
                                    safeColorIndex:
                                        menuData[menuData.length - 1]
                                            .safeIndex),
                                Container(
                                    width: 160,
                                    height: 70,
                                    color: Colors.transparent)
                              ],
                            ),
                    SizedBox(
                      height: 100,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  MenuCard(
      {Key key,
      @required this.imgName,
      @required this.deviceName,
      @required this.safeColorIndex})
      : super(key: key);
  String imgName;
  String deviceName;
  int safeColorIndex;

  @override
  Widget build(BuildContext context) {
    List<Color> safeColor = [
      wSafeColorGreen,
      wSafeColorYellow,
      wSafeColorRed,
    ];
    bool phoneSize = MediaQuery.of(context).size.width > 400 ? true : false;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      width: phoneSize ? 120 : 160,
      height: 70,
      decoration: BoxDecoration(
        color: wBlue4,
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset("assets/device/$imgName.png",width: 40,height: 40,),
          phoneSize
              ? SizedBox(
                  width: 5,
                )
              : Container(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                deviceName,
                style: wMenuFontSize,
              ),
              Text(
                "安全指標",
                style: wMenuFontSize,
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: safeColor[safeColorIndex],
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
