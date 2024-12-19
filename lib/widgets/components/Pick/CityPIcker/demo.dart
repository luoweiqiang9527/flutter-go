/// Created with Android Studio.
/// User: 三帆
/// Date: 05/02/2019
/// Time: 22:06
/// email: sanfan.hx@alibaba-inc.com
/// target:  xxx

import 'package:city_pickers/city_pickers.dart';
import 'package:flutter/material.dart';

class CityPickerDemo extends StatefulWidget {
  _Demo createState() => _Demo();
}

class _Demo extends State<CityPickerDemo> {
  String _result;
  show(context) async {
    Result temp = await CityPickers.showCityPicker(
      context: context,
      // locationCode: '640221',
      height: 400,
    );
    setState(() {
      _result = "${temp.toString()}";
    });
  }

  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Text("result: ${_result.toString()}"),
        RaisedButton(
          onPressed: () {
            show(context);
          },
          child: Text("select"),
        ),
      ],
    ));
  }
}
