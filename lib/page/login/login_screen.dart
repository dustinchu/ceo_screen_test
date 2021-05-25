import 'package:ecocore_screen_test/common/style/colors.dart';
import 'package:ecocore_screen_test/widget/arrow_back.dart';
import 'package:ecocore_screen_test/widget/btn.dart';
import 'package:ecocore_screen_test/widget/login_textformfield.dart';
import 'package:ecocore_screen_test/widget/orher_login_icon.dart';
import 'package:flutter/material.dart';

import 'forgot_password_dialog.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showDialogStatus = false;
  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    void backClick() {}

    void facebookClick() {}
    void googleClick() {}
    void appleClick() {}
    void loginClick() {}
    void forgotPasswordClick() {
      setState(() {
        showDialogStatus = true;
      });
      showDialog(context: context, builder: (ctx) => ForgotPasswordDialog())
          .then((value) {
        setState(() {
          showDialogStatus = false;
        });
        print("dialog colse");
      });
    }

    return Scaffold(
      backgroundColor: wBackground,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Opacity(
                  opacity: showDialogStatus ? 0.0 : 1.0,
                  child: ArrowBack(
                    fonStyle: wFontBoldH1,
                    text: "登入",
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
                  controller: _emailController,
                  text: "信箱",
                  validator: (_) {},
                  obscureText: false,
                ),
                SizedBox(
                  height: 20,
                ),
                LoginTextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  controller: _passwordController,
                  text: "密碼",
                  validator: (_) {},
                  obscureText: true,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(onTap: forgotPasswordClick, child: Text("忘記密碼?"))
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Btn(
                  click: loginClick,
                  textStyle: wFontBoldH3,
                  text: "登入",
                  w: 250,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
