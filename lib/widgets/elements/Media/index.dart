/// @Author: 一凨
/// @Date: 2018-11-16 15:09:27
/// @Last Modified by:   一凨
/// @Last Modified time: 2018-11-16 15:09:27

import 'Canvas/index.dart' as Canvas;
import 'Icon/index.dart' as Icon;
import 'Image/index.dart' as Image;

List getWidgets() {
  List result = [];
  result.addAll(Image.widgetPoints);
  result.addAll(Icon.widgetPoints);
  result.addAll(Canvas.widgetPoints);
  return result;
}
