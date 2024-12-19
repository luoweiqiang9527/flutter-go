import "package:flutter/material.dart";

import '../../../../model/widget.dart';
import "AnimatedSwitcher/index.dart" as AnimatedSwitcher;
import "Switch/index.dart" as Switch;
import "SwitchListTile/index.dart" as SwitchListTile;

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'Switch',
    routerName: Switch.Demo.routeName,
    buildRouter: (BuildContext context) => Switch.Demo(),
  ),
  WidgetPoint(
    name: 'SwitchListTile',
    routerName: SwitchListTile.Demo.routeName,
    buildRouter: (BuildContext context) => SwitchListTile.Demo(),
  ),
  WidgetPoint(
    name: 'AnimatedSwitcher',
    routerName: AnimatedSwitcher.Demo.routeName,
    buildRouter: (BuildContext context) => AnimatedSwitcher.Demo(),
  )
];
