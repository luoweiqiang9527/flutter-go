import 'Align/index.dart' as Align;
import 'Box/index.dart' as Box;
import 'Expanded/index.dart' as Expanded;
import 'Layout/index.dart' as Layout;
import 'Spacing/index.dart' as Spacing;
import 'Stack/index.dart' as Stack;
import 'Table/index.dart' as Table;

List getWidgets() {
  List result = [];
  result.addAll(Spacing.widgetPoints);
  result.addAll(Expanded.widgetPoints);
  // result.addAll(Axis.widgetPoints);
  result.addAll(Table.widgetPoints);
  result.addAll(Align.widgetPoints);
  result.addAll(Layout.widgetPoints);
  result.addAll(Stack.widgetPoints);
  result.addAll(Box.widgetPoints);
  return result;
}
