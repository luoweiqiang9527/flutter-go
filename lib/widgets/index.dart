import 'components/index.dart' as components;
import 'elements/index.dart' as elements;
import 'themes/index.dart' as themes;

class WidgetDemoList {
  WidgetDemoList();

  List getDemos() {
    List result = [];
    result.addAll(elements.getWidgets());
    result.addAll(components.getWidgets());
    result.addAll(themes.getWidgets());
    return result;
  }
}
