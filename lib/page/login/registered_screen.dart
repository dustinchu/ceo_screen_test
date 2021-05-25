import 'package:ecocore_screen_test/common/style/colors.dart';
import 'package:ecocore_screen_test/widget/arrow_back.dart';
import 'package:ecocore_screen_test/widget/btn.dart';
import 'package:ecocore_screen_test/widget/login_textformfield.dart';
import 'package:ecocore_screen_test/widget/orher_login_icon.dart';
import 'package:flutter/material.dart';

import 'forgot_password_dialog.dart';
import 'send_check_email.dialog.dart';

class RegisteredScreen extends StatefulWidget {
  RegisteredScreen({Key key}) : super(key: key);

  @override
  _RegisteredScreenState createState() => _RegisteredScreenState();
}

bool showDialogStatus = false;

class _RegisteredScreenState extends State<RegisteredScreen> {
  TextEditingController _nameController;
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _checkPasswordController;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _checkPasswordController = TextEditingController();
  }

  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    void registerClick() {
      setState(() {
        showDialogStatus = true;
      });
      showDialog(context: context, builder: (ctx) => SendCheckEmailDialog())
          .then((value) {
        setState(() {
          showDialogStatus = false;
        });
        print("dialog colse");
      });
    }

    void backClick() {}

    void facebookClick() {}
    void googleClick() {}
    void appleClick() {}

    return Scaffold(
      backgroundColor: wBackground,
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          // margin: EdgeInsets.only(top: 20, left: 30, right: 30),
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Opacity(
                        opacity: showDialogStatus ? 0.0 : 1.0,
                        child: ArrowBack(
                          fonStyle: wFontBoldH1,
                          text: "註冊",
                          click: backClick,
                        ),
                      ),
                      OrherLoginIcon(
                        facebookClick: facebookClick,
                        appleClick: appleClick,
                        googleClick: googleClick,
                      ),
                      Text(
                        "或者使用信箱登入",
                        style: wFontBoldH4,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      LoginTextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _nameController,
                        text: "ID 名稱   ",
                        validator: (_) {},
                        obscureText: false,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      LoginTextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: _emailController,
                        text: "信箱        ",
                        validator: (_) {},
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      LoginTextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: _passwordController,
                        text: "密碼        ",
                        validator: (_) {},
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      LoginTextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: _checkPasswordController,
                        text: "密碼確認",
                        validator: (_) {},
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    // margin: EdgeInsets.only(bottom:deviceHeight-650 ),
                    child: Btn(
                      click: registerClick,
                      textStyle: wFontBoldH3,
                      text: "註冊",
                      w: 250,
                    ),
                  ),
                  SizedBox(
                    height: deviceHeight > 700 ? 150 : 15,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
