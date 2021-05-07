import 'package:ecocore_screen_test/common/style/colors.dart';
import 'package:intl/intl.dart' as intl;
import 'dart:async';
import 'package:flutter/material.dart';

import 'bezier_chart.dart';

class Sample14 extends StatefulWidget {
  @override
  _Sample14State createState() => _Sample14State();
}

class _Sample14State extends State<Sample14> {
  DateTime fromDate;
  DateTime toDate;

  @override
  void initState() {
    super.initState();
    fromDate = DateTime(2019, 09, 1);
    toDate = DateTime(2019, 09, 30);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final date1 = toDate.subtract(Duration(days: 2));
    final date2 = toDate.subtract(Duration(days: 3));
    return Scaffold(
      body: Center(
        child: Container(
          color: wBlue4,
          height: 160,
          // height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          child: BezierChart(
            fromDate: fromDate,
            bezierChartScale: BezierChartScale.WEEKLY,
            toDate: toDate,
            onIndicatorVisible: (val) {
              print("Indicator Visible :$val");
            },
            onDateTimeSelected: (datetime) {
              print("selected datetime: $datetime");
            },
            selectedDate: toDate,
            //this is optional
            footerDateTimeBuilder:
                (DateTime value, BezierChartScale scaleType) {
              final newFormat = intl.DateFormat('d EE',"zh_HK");
              return newFormat.format(value);
            },
            bubbleLabelDateTimeBuilder:
                (DateTime value, BezierChartScale scaleType) {
              // final newFormat = intl.DateFormat('EEE d',);
              final newFormat = intl.DateFormat('y/M/d','zh_HK');
              print("newFormat2===${newFormat.format(value)}");
              return "${newFormat.format(value)}\n";
            },
            series: [
              BezierLine(
                lineStrokeWidth:1,
                label: "NTD.",
                onMissingValue: (dateTime) {
                  return 3120.5;
                },
                data: [
                  DataPoint<DateTime>(
                      value: 3235.9, xAxis: DateTime(2019, 9, 24)),
                  DataPoint<DateTime>(
                      value: 2340.5, xAxis: DateTime(2019, 9, 25)),
                  DataPoint<DateTime>(
                      value: 2115.21, xAxis: DateTime(2019, 9, 26)),
                  DataPoint<DateTime>(
                      value: 3120.5, xAxis: DateTime(2019, 9, 27)),
                  DataPoint<DateTime>(
                      value: 3235.9, xAxis: DateTime(2019, 9, 30)),
                ],
             

              ),
            ],
            config: BezierChartConfig(
              // displayLinesXAxis: true,
              // xLinesColor: Colors.pink,
              xAxisTextStyle: wFontH4,
              updatePositionOnTap: true,
              bubbleIndicatorValueFormat: intl.NumberFormat("###,##0.00", "zh"),
              verticalIndicatorStrokeWidth: 1.0,
              verticalIndicatorColor: Colors.white30,
              showVerticalIndicator: false,
              verticalIndicatorFixedPosition: false,
              backgroundColor: Colors.transparent,
              footerHeight: 60.0,
            ),
          ),
        ),
      ),
    );
  }
}
