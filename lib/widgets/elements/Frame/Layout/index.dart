import "package:flutter/material.dart";

import '../../../../model/widget.dart';
import 'Center/index.dart' as Center;
import 'Column/index.dart' as Column;
import 'Container/index.dart' as Container;
import 'Row/index.dart' as Row;

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'Row',
    routerName: Row.Demo.routeName,
    buildRouter: (BuildContext context) => Row.Demo(),
  ),
  WidgetPoint(
    name: 'Column',
    routerName: Column.Demo.routeName,
    buildRouter: (BuildContext context) => Column.Demo(),
  ),
  WidgetPoint(
    name: 'Container',
    routerName: Container.Demo.routeName,
    buildRouter: (BuildContext context) => Container.Demo(),
  ),
  WidgetPoint(
    name: 'Center',
    routerName: Center.Demo.routeName,
    buildRouter: (BuildContext context) => Center.Demo(),
  ),
];
