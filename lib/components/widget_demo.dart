/// @author Nealyang
/// 新widget详情页模板

import 'dart:core';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_go/utils/data_utils.dart';

import '../components/markdown.dart';
import '../event/event_bus.dart';
import '../event/event_model.dart';
import '../routers/application.dart';
import '../routers/routers.dart';
/// import '../model/collection.dart';
import '../widgets/index.dart';

class WidgetDemo extends StatefulWidget {
  final List<dynamic> contentList;
  final String docUrl;
  final String title;
  final String codeUrl;
  final Widget bottomNaviBar;

  WidgetDemo(
      {Key key,
      @required this.title,
      @required this.contentList,
      this.codeUrl,
      this.docUrl,
      this.bottomNaviBar})
      : super(key: key);

  _WidgetDemoState createState() => _WidgetDemoState();
}

class _WidgetDemoState extends State<WidgetDemo> {
  bool _hasCollected = false;

  /// CollectionControlModel _collectionControl = new CollectionControlModel();
  var _collectionIcons;
  List widgetDemosList = WidgetDemoList().getDemos();
  String widgetType = 'old';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Widget> _buildContent() {
    List<Widget> _list = [
      SizedBox(
        height: 10.0,
      ),
    ];
    for (var item in widget.contentList) {
      if (item.runtimeType == String) {
        _list.add(MarkdownBody(item));
        _list.add(
          SizedBox(
            height: 20.0,
          ),
        );
      } else {
        _list.add(item);
      }
    }
    return _list;
  }

  @override
  void initState() {
    super.initState();
    // 这里不能直接 使用 ` ModalRoute.of(context)` 会产生报错
    Future.delayed(Duration.zero, () {
      String currentPath = ModalRoute.of(context).settings.name;
      if (currentPath.indexOf('/standard-page') == 0) {
        widgetType = 'standard';
      }
      Map<String, String> params = {
        'type': widgetType,
        "url": currentPath,
        "name": widget.title
      };
      DataUtils.checkCollected(params).then((result) {
        if (mounted) {
          setState(() {
            _hasCollected = result ?? null;
          });
        }
      });
    });
  }

// 点击收藏按钮
  _getCollection() {
    String currentRouterPath = ModalRoute.of(context).settings.name;
    Map<String, String> params = {
      "type": widgetType,
      "url": currentRouterPath,
      "name": widget.title
    };
    if (_hasCollected) {
      // 删除操作
      DataUtils.removeCollected(params, context).then((result) {
        if (result) {
          _scaffoldKey.currentState
              .showSnackBar(SnackBar(content: Text('已取消收藏')));
          ApplicationEvent.event
              .fire(CollectionEvent(widget.title, currentRouterPath, true));
                  if (mounted) {
            setState(() {
              _hasCollected = false;
            });
          }
        }
      });
    } else {
      // 插入操作
      DataUtils.addCollected(params, context).then((result) {
        if (result) {
          if (mounted) {
            setState(() {
              _hasCollected = true;
            });
          }
          _scaffoldKey.currentState
              .showSnackBar(SnackBar(content: Text('收藏成功')));
          ApplicationEvent.event
              .fire(CollectionEvent(widget.title, currentRouterPath, false));
                }
      });
    }
  }

  void _selectValue(value) {
    if (value == 'doc') {
      // _launchURL(widget.docUrl);
      Application.router.navigateTo(
        context,
        '${Routes.webViewPage}?title=${Uri.encodeComponent(widget.title)} Doc&&url=${Uri.encodeComponent(widget.docUrl)}',
        transition: TransitionType.nativeModal,
      );
    } else if (value == 'code') {
      Application.router.navigateTo(
        context,
        '${Routes.codeView}?filePath=${Uri.encodeComponent(widget.codeUrl)}',
        transition: TransitionType.nativeModal,
      );
    }
  }

  List<PopupMenuEntry<String>> buildPopupMenu() {
    List<PopupMenuEntry<String>> comps = [];
    comps.add(PopupMenuItem<String>(
      value: 'doc',
      child: ListTile(
        leading: Icon(
          Icons.library_books,
          size: 22.0,
        ),
        title: Text('查看文档'),
      ),
    ));
      comps.add(PopupMenuItem<String>(
      value: 'code',
      child: ListTile(
        leading: Icon(
          Icons.code,
          size: 22.0,
        ),
        title: Text('查看Demo'),
      ),
    ));
      return comps;
  }

  @override
  Widget build(BuildContext context) {
    if (_hasCollected) {
      _collectionIcons = Icons.favorite;
    } else {
      _collectionIcons = Icons.favorite_border;
    }
    List<PopupMenuEntry<String>> menus = buildPopupMenu();
    List<Widget> actions = [
      IconButton(
        tooltip: 'goBack home',
        onPressed: () {
          Navigator.popUntil(context, ModalRoute.withName(Routes.root));
        },
        icon: Icon(Icons.home),
      ),
      IconButton(
        tooltip: 'collection',
        onPressed: _getCollection,
        icon: Icon(_collectionIcons),
      ),
    ];
    if (menus.isNotEmpty) {
      actions.add(PopupMenuButton<String>(
        onSelected: _selectValue,
        itemBuilder: (BuildContext context) => menus,
      ));
    }
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(widget.title),
          actions: actions,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(0.0),
            children: <Widget>[
              Column(
                children: _buildContent(),
              ),
            ],
          ),
        ),
        bottomNavigationBar:
            (widget.bottomNaviBar is Widget) ? widget.bottomNaviBar : null);
  }
}
