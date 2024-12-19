/// Created with Android Studio.
/// User: 三帆
/// Date: 27/12/2018
/// Time: 17:30
/// email: sanfan.hx@alibaba-inc.com
/// target:  xxx

import 'package:flutter/material.dart';

class SwitchDemo extends StatefulWidget {
  _Demo createState() => _Demo();
}

class _Demo extends State<SwitchDemo> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: check,
      onChanged: (bool val) {
        setState(() {
          check = !check;
        });
      },
    );
  }
}

class SwitchHighDemo extends StatefulWidget {
  _SwitchHighDemo createState() => _SwitchHighDemo();
}

class _SwitchHighDemo extends State<SwitchHighDemo> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Switch.adaptive(
      value: check,
      activeColor: Colors.blue, // 激活时原点颜色
      onChanged: (bool val) {
        setState(() {
          check = !check;
        });
      },
    );
  }
}

class SwitchTypesDemo extends StatefulWidget {
  _SwitchTypesDemo createState() => _SwitchTypesDemo();
}

class _SwitchTypesDemo extends State<SwitchTypesDemo> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: check,
      activeTrackColor: Colors.green,
      inactiveThumbColor: Colors.black,
      inactiveThumbImage: NetworkImage(
          'https://flutter.io/images/homepage/header-illustration.png'),
      activeThumbImage:
          NetworkImage("https://flutter.io/images/homepage/screenshot-2.png"),
      inactiveTrackColor: Colors.yellow,
      activeColor: Colors.blue, // 激活时原点颜色
      onChanged: (bool val) {
        setState(() {
          check = !check;
        });
      },
    );
  }
}
