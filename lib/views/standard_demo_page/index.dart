//
// Created with Android Studio.
// User: 三帆
// Date: 25/05/2019
// Time: 21:46
// email: sanfan.hx@alibaba-inc.com
// tartget:  xxx
//

import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_go/components/loading.dart';
import 'package:flutter_go/routers/application.dart';
import 'package:flutter_go/routers/routers.dart';
import 'package:flutter_go/utils/net_utils.dart';

import '../../components/flutter_markdown/lib/flutter_markdown.dart';
import '../../components/markdown.dart' as mdCopy;
import '../../components/widget_demo.dart';
import '../../page_demo_package/index.dart';
import '../../standard_pages/index.dart';

const githubHost =
    'https://raw.githubusercontent.com/alibaba/flutter-go/master';
const githubUrl = '$githubHost/lib/standard_pages/';
const PagesUrl = '$githubHost/lib/standard_pages/.pages.json';
const DemosUrl = '$githubHost/lib/page_demo_package/.demo.json';

// ONLINE || LOCAL
ENV env = Application.env;

class StandardView extends StatefulWidget {
  final String id;
  final String detailMd;
  StandardView({this.id, this.detailMd});
  @override
  _StandardView createState() => _StandardView();
}

class _StandardView extends State<StandardView> {
  String markdownDesc = '';
  String pageTitle = '';
  bool isLoading = false;
  String author = '';
  String email = '';
  StandardPages standardPage = StandardPages();
  @override
  void initState() {
    super.initState();
    getPageInfo();
  }

//  didChangeDependencies() {
//    print("didChangeDependencies");
//  }
  /// 本地调用的获取文章属性的基本信息
  Future<void> localGetPagesAttrsInfo() async {
    String jsonString = await DefaultAssetBundle.of(context)
        .loadString('lib/standard_pages/.pages.json');
    List jsonList = json.decode(jsonString);
    Map<String, dynamic> pageDetail =
        jsonList.firstWhere((item) => item['id'] == widget.id, orElse: null);

    setState(() {
      pageTitle = pageDetail['title'] ?? '请加入title';
      author = pageDetail['author'];
      email = pageDetail['email'];
    });
    }

  /// 从本地获取基本文章信息
  String localGetPagesMarkdown() {
    String pageId = widget.id;
    Map<String, String> pagesList = standardPage.getPages();
//    print('pagesList[pageId]>>> ${pagesList[pageId]}');
    return pagesList[pageId];
  }

  Future<String> getContentOnline() async {
    setState(() {
      isLoading = true;
    });

    List response = jsonDecode(await NetUtils.get(PagesUrl));

    Map targetPage = response.firstWhere((page) => page['id'] == widget.id);
    setState(() {
      pageTitle = targetPage['title'] ?? 'xxx';
      author = targetPage['author'];
      email = targetPage['email'];
    });

    String pageName = targetPage['name'] +
        "_" +
        targetPage['author'] +
        "_" +
        targetPage['id'];
    String pageContent = await NetUtils.get("$githubUrl$pageName/index.md");
    setState(() {
      isLoading = false;
    });
    return Future(() => pageContent);
  }

  /// 获取当面界面的相关信息. 需要区分环境
  /// 本地环境下, 从本地获取 standard_pages的目录中互殴
  /// 线上环境. 从github的api中获取
  Future<String> getPageInfo() async {
    String conent = '';
    print("env:::: $env");

    if (env == ENV.PRODUCTION) {
      conent = await getContentOnline();
    } else {
      conent = localGetPagesMarkdown();
      localGetPagesAttrsInfo();
    }
    if (mounted) {
      setState(() {
        markdownDesc = conent;
      });
    }
    return Future(() => conent);
  }

  Future<void> seeSourceCode(id) async {
    List response;
    try {
      response = jsonDecode(await NetUtils.get(DemosUrl));
    } catch (e) {
      return alertDialog(msg: '请检查网络链接', title: '提示');
    }

    Map<String, dynamic> demoDetail =
        response.firstWhere((item) => item['id'] == id, orElse: null);

    String remoteSouceCode =
        '$githubHost/lib/page_demo_package/${demoDetail['name']}_${demoDetail['author']}_${demoDetail['id']}/src/index.dart';
    Application.router.navigateTo(
      context,
      '${Routes.githubCodeView}?remotePath=${Uri.encodeComponent(remoteSouceCode)}',
      transition: TransitionType.nativeModal,
    );
  }

  Widget buildFootInfo() {
    if (!isLoading) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('创建者: $author'),
            Text('邮箱: $email'),
            Text('界面id: ${widget.id}')
          ],
        ),
      );
    }
    return Container();
  }

  Widget buildMarkdown() {
    if (Application.env == ENV.DEV) {
      // 为了能在local改变的时候. 动态更新内容, getPageInfo只有初始化状态下会有效果
      markdownDesc = localGetPagesMarkdown();
    }
  
    return MarkdownBody(
        data: markdownDesc,
        syntaxHighlighter: mdCopy.HighLight(),
        demoBuilder: (Map<String, dynamic> attrs) {
          List<Widget> demo = demoObjects[attrs['id']];
          return Column(
            children: <Widget>[
              Column(
                children: demo,
              ),
              Divider(
                color: Theme.of(context).primaryColor,
              ),
              InkWell(
                onTap: () {
                  seeSourceCode(attrs['id']);
                },
                child: Text("查看源码",
                    style: TextStyle(color: Theme.of(context).primaryColor)),
              )
            ],
          );
                });
  }

  alertDialog({String msg, String title}) {
    showDialog<Null>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(msg),
                ],
              ),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WidgetDemo(
      title: pageTitle,
//      codeUrl: 'elements/Form/Button/DropdownButton/demo.dart',
      contentList: [
        NetLoadingDialog(
          loading: isLoading,
          outsideDismiss: false,
        ),
        buildMarkdown(),
        SizedBox(height: 30),
        buildFootInfo(),
        SizedBox(height: 30)
      ],
    );
  }
}
