//
// Created with Android Studio.
// User: 三帆
// Date: 07/08/2019
// Time: 08:40
// email: sanfan.hx@alibaba-inc.com
// tartget: 代码获取自: https://blog.csdn.net/O_time/article/details/86496537
//
import 'dart:async';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NetLoadingDialog extends StatefulWidget {
  String loadingText;
  bool outsideDismiss;
  bool loading;
  Function dismissCallback;
  Future<dynamic> requestCallBack;

  NetLoadingDialog(
      {Key key,
      this.loadingText = "loading...",
      this.outsideDismiss = true,
      this.dismissCallback,
      this.loading,
      this.requestCallBack})
      : super(key: key);

  @override
  State<NetLoadingDialog> createState() => _LoadingDialog();
}

class _LoadingDialog extends State<NetLoadingDialog> {
  _dismissDialog() {
    widget.dismissCallback();
      Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    widget.requestCallBack.then((_) {
      Navigator.pop(context);
    });
    }

  @override
  Widget build(BuildContext context) {
    if (!widget.loading) {
      return Container();
    }
    return GestureDetector(
      onTap: widget.outsideDismiss ? _dismissDialog : null,
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: SizedBox(
            width: 120.0,
            height: 120.0,
            child: Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                    ),
                    child: Text(
                      widget.loadingText,
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
