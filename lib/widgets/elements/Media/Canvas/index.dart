import "package:flutter/material.dart";
import 'package:flutter_go/model/widget.dart';

import 'Canvas/index.dart' as Canvas;
import 'CircleProgressBarPainter/index.dart' as CircleProgressBarPainter;
import 'PainterPath/index.dart' as PainterPath;
import 'PainterSketch/index.dart' as PainterSketch;

List<WidgetPoint> widgetPoints = [
  WidgetPoint(
    name: 'PainterSketch',
    routerName: PainterSketch.Demo.routeName,
    buildRouter: (BuildContext context) => PainterSketch.Demo(),
  ),
  WidgetPoint(
    name: 'Canvas',
    routerName: Canvas.Demo.routeName,
    buildRouter: (BuildContext context) => Canvas.Demo(),
  ),
  WidgetPoint(
    name: 'PainterPath',
    routerName: PainterPath.Demo.routeName,
    buildRouter: (BuildContext context) => PainterPath.Demo(),
  ),
  WidgetPoint(
    name: 'CircleProgressBarPainter',
    routerName: CircleProgressBarPainter.Demo.routeName,
    buildRouter: (BuildContext context) => CircleProgressBarPainter.Demo(),
  )
];
