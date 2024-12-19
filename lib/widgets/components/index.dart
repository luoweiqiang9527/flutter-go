/// @Author: 一凨
/// @Date: 2018-12-10 20:34:18
/// @Last Modified by: 一凨
/// @Last Modified time: 2018-12-22 21:25:40

import 'Bar/index.dart' as Bar;
import 'Card/index.dart' as Card;
import 'Chip/index.dart' as Chip;
import 'Dialog/index.dart' as Dialog;
import 'Grid/index.dart' as GridTile;
import 'List/index.dart' as Li;
import 'Menu/index.dart' as Menu;
import 'Navigation/index.dart' as Navigation;
import 'Panel/index.dart' as Panel;
import 'Pick/index.dart' as Pick;
import 'Progress/index.dart' as Progress;
import 'Scaffold/index.dart' as Scaffold;
import 'Scroll/index.dart' as Scroll;
import 'Tab/index.dart' as Ta;

List getWidgets() {
  List result = [];
  result.addAll(Scroll.widgetPoints);
  result.addAll(Pick.widgetPoints);
  result.addAll(Chip.widgetPoints);
  result.addAll(Panel.widgetPoints);
  result.addAll(Progress.widgetPoints);
  result.addAll(Ta.widgetPoints);
  result.addAll(Menu.widgetPoints);
  result.addAll(Navigation.widgetPoints);
  result.addAll(Li.widgetPoints);
  result.addAll(Card.widgetPoints);
  result.addAll(Bar.widgetPoints);
  result.addAll(Dialog.widgetPoints);
  result.addAll(Scaffold.widgetPoints);
  result.addAll(GridTile.widgetPoints);
  return result;
}
