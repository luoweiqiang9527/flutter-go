import "package:flutter/material.dart";

import '../../../../model/widget.dart';
import 'DropdownButton/index.dart' as DropdownButton;
import 'FlatButton/index.dart' as FlatButton;
import 'FloatingActionButton/index.dart' as FloatingActionButton;
import 'IconButton/index.dart' as IconButton;
import 'OutlineButton/index.dart' as OutlineButton;
import 'PopupMenuButton/index.dart' as PopupMenuButton;
import 'RaisedButton/index.dart' as RaisedButton;
import 'RawMaterialButton/index.dart' as RawMaterialButton;

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'FlatButton',
    routerName: FlatButton.Demo.routeName,
    buildRouter: (BuildContext context) => FlatButton.Demo(),
  ),
  WidgetPoint(
    name: 'RaisedButton',
    routerName: RaisedButton.Demo.routeName,
    buildRouter: (BuildContext context) => RaisedButton.Demo(),
  ),
  WidgetPoint(
    name: 'OutlineButton',
    routerName: OutlineButton.Demo.routeName,
    buildRouter: (BuildContext context) => OutlineButton.Demo(),
  ),
  WidgetPoint(
    name: 'IconButton',
    routerName: IconButton.Demo.routeName,
    buildRouter: (BuildContext context) => IconButton.Demo(),
  ),
  WidgetPoint(
    name: 'PopupMenuButton',
    routerName: PopupMenuButton.Demo.routeName,
    buildRouter: (BuildContext context) => PopupMenuButton.Demo(),
  ),
  WidgetPoint(
    name: 'FloatingActionButton',
    routerName: FloatingActionButton.Demo.routeName,
    buildRouter: (BuildContext context) => FloatingActionButton.Demo(),
  ),
  WidgetPoint(
    name: 'RawMaterialButton',
    routerName: RawMaterialButton.Demo.routeName,
    buildRouter: (BuildContext context) => RawMaterialButton.Demo(),
  ),
  WidgetPoint(
    name: 'DropdownButton',
    routerName: DropdownButton.Demo.routeName,
    buildRouter: (BuildContext context) => DropdownButton.Demo(),
  )
];
