///
/// Created with Android Studio.
/// User: 三帆
/// Date: 18/02/2019
/// Time: 14:19
/// email: sanfan.hx@alibaba-inc.com
/// target: 搜索WidgetDemo中的历史记录model
///

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_go/utils/shared_preferences.dart';

class SearchHistory {
  final String name;
  final String targetRouter;

  SearchHistory({@required this.name, @required this.targetRouter});
}

class SearchHistoryList {
  static SpUtil _sp;
  static SearchHistoryList _instance;
  static List<SearchHistory> _searchHistoryList = [];

  static SearchHistoryList _getInstance(SpUtil sp) {
    return _instance;
  }

  factory SearchHistoryList([SpUtil sp]) {
    if (sp == null && _instance == null) {
      print(ArgumentError(
          ['SearchHistoryList need instantiatied SpUtil at first timte ']));
    }
    return _getInstance(sp);
  }

//  List<SearchHistory> _searchHistoryList = [];

  // 存放的最大数量
  int _count = 10;

  SearchHistoryList.fromJSON(String jsonData) {
    _searchHistoryList = [];
    List jsonList = json.decode(jsonData);
    for (var value in jsonList) {
      _searchHistoryList.add(SearchHistory(
          name: value['name'], targetRouter: value['targetRouter']));
    }
  }

  List<SearchHistory> getList() {
    return _searchHistoryList;
  }

  clear() {
    _sp.remove(SharedPreferencesKeys.searchHistory);
    _searchHistoryList = [];
  }

  save() {
    _sp.putString(SharedPreferencesKeys.searchHistory, toJson());
  }

  add(SearchHistory item) {
    print("add item to serach history ${item.targetRouter}");
    for (SearchHistory value in _searchHistoryList) {
      if (value.name == item.name) {
        return;
      }
    }
    if (_searchHistoryList.length > _count) {
      _searchHistoryList.removeAt(0);
    }
    _searchHistoryList.add(item);
    save();
  }

  toJson() {
    List<Map<String, String>> jsonList = [];
    for (var value in _searchHistoryList) {
      jsonList.add({'name': value.name, 'targetRouter': value.targetRouter});
    }
    return json.encode(jsonList);
  }

  @override
  String toString() {
    return toJson();
  }
}
