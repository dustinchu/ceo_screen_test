import 'package:ecocore_screen_test/common/style/colors.dart';
import 'package:ecocore_screen_test/page/%08group/group_screen.dart';
import 'package:ecocore_screen_test/page/device/device_screen.dart';
import 'package:ecocore_screen_test/page/home/home_screen.dart';
import 'package:ecocore_screen_test/page/setting/setting_screen.dart';
import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _IndexState();
  }
}

Widget tapbarIcon(String imaPath) {
  return Padding(
    padding: EdgeInsets.only(top: 5, bottom: 5),
    child: new Image.asset(imaPath),
  );
}

class _IndexState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomNavItems = [
    BottomNavigationBarItem(
        icon: tapbarIcon('assets/icon/tapbar_group_default.png'),
        activeIcon: tapbarIcon('assets/icon/tapbar_group_click.png'),
        label: "群組"),
    BottomNavigationBarItem(
        icon: tapbarIcon('assets/icon/tapbar_home_default.png'),
        activeIcon: tapbarIcon('assets/icon/tapbar_home_click.png'),
        label: "首頁"),
    BottomNavigationBarItem(
        icon: tapbarIcon('assets/icon/tapbar_setting_default.png'),
        activeIcon: tapbarIcon('assets/icon/tapbar_setting_click.png'),
        label: "設定"),
  ];

  int currentIndex;

  final pages = [DeviceScreen(), HomeScreen(), SettingScreen()];

  @override
  void initState() {
    super.initState();
    currentIndex = 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: wBlue4,
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: BottomNavigationBar(
          elevation: 0,
          selectedFontSize: 0,
          selectedLabelStyle: wFontH4,
          selectedItemColor: Colors.white,
          unselectedItemColor: wBlue2,
          backgroundColor: wBlue4,
          items: bottomNavItems,
          currentIndex: currentIndex,
          // type: BottomNavigationBarType.shifting,
          onTap: (index) {
            _changePage(index);
          },
        ),
      ),
      body: pages[currentIndex],
    );
  }

  /*切换页面*/
  void _changePage(int index) {
    /*如果点击的导航项不是当前项  切换 */
    if (index != currentIndex) {
      setState(() {
        currentIndex = index;
      });
    }
  }
}
