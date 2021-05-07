import 'package:ecocore_screen_test/common/style/colors.dart';
import 'package:flutter/material.dart';

class LoginTextFormField extends StatelessWidget {
  final FormFieldValidator<String> validator;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String text;
  final bool obscureText;
  LoginTextFormField(
      {@required this.validator,
      @required this.controller,
      @required this.keyboardType,
      @required this.text,
       @required this.obscureText,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      height: 40,
      decoration: new BoxDecoration(
        color: wBlue3,
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Row(
        children: [
          Text(
            text,
            style: wFontBoldH4,
          ),
          // SizedBox(
          //   width: 50,
          // ),
          //
          Flexible(
            child: new TextField(
              obscureText: obscureText,
              keyboardType: keyboardType,
              style: wFontBoldH4,
              textAlignVertical: TextAlignVertical.bottom,
              decoration: InputDecoration(
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.only(
                  left: 50,
                  bottom: 18,
                ),
                // contentPadding: EdgeInsets.only(left: 50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
