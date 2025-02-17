/// Author: 一凨
/// Date: 2019-01-11 14:39:48
/// Last Modified by: 一凨
/// Last Modified time: 2019-01-11 14:40:09

import 'package:flutter/material.dart';

import 'package:flutter_go/components/cate_card.dart';

import 'package:flutter_go/routers/application.dart';

class WidgetPage extends StatefulWidget {
  @override
  SecondPageState createState() => SecondPageState();
}

class SecondPageState extends State<WidgetPage>
    with AutomaticKeepAliveClientMixin {
  SecondPageState() : super();

  TextEditingController controller;
  String active = 'test';
  String data = '无';

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  Widget buildGrid() {
    // 存放最后的widget
    List<Widget> tiles = [];
    for (var item in Application.widgetTree.children) {
      tiles.add(CateCard(category: item));
    }
    return ListView(
      children: tiles,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: buildGrid(),
    );
  }
}
