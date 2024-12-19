/// @Author: xiaojia.dxj
/// @Date: 2018-12-24 16:31:09
/// @Last Modified by:   xiaojia.dxj
/// @Last Modified time: 2018-12-24 16:31:09

import './Cupertino/index.dart' as Cupertino;
import './Material/index.dart' as Material;

List getWidgets() {
  List result = [];
  result.addAll(Material.widgetPoints);
  result.addAll(Cupertino.widgetPoints);
  return result;
}
