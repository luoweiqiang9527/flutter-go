import "package:flutter/material.dart";

import '../../../../model/widget.dart';
import 'Icon/index.dart' as Icon;
import 'IconData/index.dart' as IconData;
import 'IconTheme/index.dart' as IconTheme;
import 'IconThemeData/index.dart' as IconThemeData;
import 'ImageIcon/index.dart' as ImageIcon;

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'Icon',
    routerName: Icon.Demo.routeName,
    buildRouter: (BuildContext context) => Icon.Demo(),
  ),
  WidgetPoint(
    name: 'ImageIcon',
    routerName: ImageIcon.Demo.routeName,
    buildRouter: (BuildContext context) => ImageIcon.Demo(),
  ),
  WidgetPoint(
    name: 'IconTheme',
    routerName: IconTheme.Demo.routeName,
    buildRouter: (BuildContext context) => IconTheme.Demo(),
  ),
  WidgetPoint(
    name: 'IconData',
    routerName: IconData.Demo.routeName,
    buildRouter: (BuildContext context) => IconData.Demo(),
  ),
  WidgetPoint(
    name: 'IconThemeData',
    routerName: IconThemeData.Demo.routeName,
    buildRouter: (BuildContext context) => IconThemeData.Demo(),
  ),
];
