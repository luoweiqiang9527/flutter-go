import 'package:flutter/material.dart';

import '../../../../model/widget.dart';
import './AnimatedPadding/index.dart' as AnimatedPadding;
import './Padding/index.dart' as Padding;
import './SliverPadding/index.dart' as SliverPadding;

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'Padding',
    routerName: Padding.Demo.routeName,
    buildRouter: (BuildContext context) => Padding.Demo(),
  ),
  WidgetPoint(
    name: 'SliverPadding',
    routerName: SliverPadding.Demo.routeName,
    buildRouter: (BuildContext context) => SliverPadding.Demo(),
  ),
  WidgetPoint(
    name: 'AnimatedPadding',
    routerName: AnimatedPadding.Demo.routeName,
    buildRouter: (BuildContext context) => AnimatedPadding.Demo(),
  ),
];
