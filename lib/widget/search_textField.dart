import 'package:ecocore_screen_test/common/style/colors.dart';
import 'package:flutter/material.dart';

class Search_textField extends StatelessWidget {
  Search_textField({Key key, @required this.searchController})
      : super(key: key);
  TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      height: 50,
      child: TextField(
          controller: searchController,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: -5),
              prefixIcon: Icon(Icons.search, color: Colors.white),
              filled: true,
              fillColor: wBlue3,
              border: OutlineInputBorder(
                  // borderSide: BorderSide(color: wBlue3, width: 32.0),
                  borderRadius: BorderRadius.circular(25.0)),
              focusedBorder: OutlineInputBorder(
                  // borderSide: BorderSide(color: wBlue3, width: 32.0),
                  borderRadius: BorderRadius.circular(25.0)))),
    );
  }
}
