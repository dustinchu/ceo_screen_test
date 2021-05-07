import 'package:ecocore_screen_test/common/style/colors.dart';
import 'package:flutter/material.dart';

class HomeTitleMessage extends StatefulWidget {
  HomeTitleMessage({Key key}) : super(key: key);

  @override
  _HomeTitleMessageState createState() => _HomeTitleMessageState();
}

class _HomeTitleMessageState extends State<HomeTitleMessage> {
  @override
  Widget build(BuildContext context) {
    return  Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 140, left: 30, right: 30),
                height: 120,
                width: double.infinity,
                decoration: new BoxDecoration(
                  color: wDialogBackground,
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "今日總花費",
                              style: wFontBoldH3,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "NTD.",
                                  style: wFontBoldH3,
                                ),
                                Text(
                                  "123.5",
                                  style: wFontBoldH1,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        height:double.infinity ,
                        width: 2,
                        color:wBlue1,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text("即刻電價",style: wFontH4,),Row(children: [
                            Text("NTD.",style:wFontBoldH4),
                            SizedBox(width: 10,),
                            Text("5.27",style:wFontBoldH4),
                          ],)],
                        ),
                      )
                    ],
                  ),
                ),
              ));
  }
}