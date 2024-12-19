import 'package:flutter/material.dart';
import 'package:flutter_go/model/widget.dart';

import './IndexedStack/index.dart' as IndexedStack;
import './Stack/index.dart' as Stack;

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'Stack',
    routerName: Stack.Demo.routeName,
    buildRouter: (BuildContext context) => Stack.Demo(),
  ),
  WidgetPoint(
    name: 'IndexedStack',
    routerName: IndexedStack.Demo.routeName,
    buildRouter: (BuildContext context) => IndexedStack.Demo(),
  ),
];
