import 'package:ecocore_screen_test/common/style/colors.dart';
import 'package:ecocore_screen_test/widget/btn.dart';
import 'package:ecocore_screen_test/widget/dialog_line.dart';
import 'package:ecocore_screen_test/widget/login_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ForgotPasswordDialog extends StatefulWidget {
  @override
  _ForgotPasswordDialogState createState() => _ForgotPasswordDialogState();
}

class _ForgotPasswordDialogState extends State<ForgotPasswordDialog> {
  TextEditingController _dialogEmailController;
  @override
  void initState() {
    super.initState();
    _dialogEmailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    void checkClick() {
      Navigator.pop(context);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Material(
          color: Colors.transparent,
          child: Row(children: [
            Container(
                margin: EdgeInsets.only(left: 20, top: 20, bottom: 60),
                child: Text("忘記密碼？", style: wFontH1))
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
                height: 280,
                child: Material(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        Text(
                          "輸入您先前註冊的電子郵件\n我們將寄送密碼重置連結至您的電子信箱。",
                          textAlign: TextAlign.center,
                          style: wFontH4,
                        ),
                        DialogLine(),
                        LoginTextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _dialogEmailController,
                          text: "信箱",
                          validator: (_) {},
                          obscureText: false,
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Btn(
                            w: 100,
                            textStyle: wFontBoldH3,
                            text: "確認",
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
