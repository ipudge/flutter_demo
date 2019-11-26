import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

const CATCH_URLS = ['m.ctrip.com/', 'm.ctrip.com/html5/', 'm.ctrip.com/html5'];

class WebView extends StatefulWidget {
  String url;
  final String title;
  final String statusBarColor;
  final bool hideAppBar;
  final bool backForbid;

  WebView(
      {this.url,
      this.statusBarColor,
      this.title,
      this.hideAppBar,
      this.backForbid = false}) {
    if (url != null && url.contains('ctrip.com')) {
      //fix 携程H5 http://无法打开问题
      url = url.replaceAll("http://", 'https://');
    }
    print(url);
  }

  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  StreamSubscription<String> _onUrlChanged;
  StreamSubscription<WebViewStateChanged> _onStateChanged;
  StreamSubscription<WebViewHttpError> _onHttpError;
  final flutterWebviewPlugin = FlutterWebviewPlugin();
  bool exiting = false;

  @override
  void initState() {
    super.initState();
    flutterWebviewPlugin.close();

    _onUrlChanged = flutterWebviewPlugin.onUrlChanged.listen((String url) {});
    _onStateChanged = flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      switch (state.type) {
        case WebViewState.startLoad:
          if (_isToMain(state.url) && !exiting) {
            if (widget.backForbid) {
              flutterWebviewPlugin.launch(widget.url);
            } else {
              Navigator.pop(context);
              exiting = true;
            }
          }
          break;
        default:
          break;
      }
    });
    _onHttpError =
        flutterWebviewPlugin.onHttpError.listen((WebViewHttpError error) {
      print(error);
    });
  }

  @override
  void dispose() {
    _onUrlChanged.cancel();
    _onStateChanged.cancel();
    _onHttpError.cancel();
    flutterWebviewPlugin.dispose();
    super.dispose();
  }

  _isToMain(String url) {
    bool contain = false;
    for (final value in CATCH_URLS) {
      if (url?.endsWith(value) ?? false) {
        contain = true;
        break;
      }
    }
    return contain;
  }

  @override
  Widget build(BuildContext context) {
    String statusBarColor = widget.statusBarColor ?? 'ffffff';
    Color backBtnColor;
    if (statusBarColor == 'ffffff') {
      backBtnColor = Colors.black;
    } else {
      backBtnColor = Colors.white;
    }
    return Scaffold(
      body: Column(
        children: <Widget>[
          _appBar(Color(int.parse('0xff' + statusBarColor)), backBtnColor),
          Expanded(
            child: WebviewScaffold(
              userAgent: 'null',
              url: widget.url,
              hidden: true,
              withZoom: true,
              withLocalStorage: true,
              initialChild: Container(
                color: Colors.white,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _appBar(Color backgroundColor, Color backBtnColor) {
    if (widget.hideAppBar ?? false) {
      return Container(
        height: 30,
        color: backgroundColor,
      );
    } else {
      return Container(
        color: backgroundColor,
        padding: EdgeInsets.fromLTRB(0, 40, 0, 10),
        child: FractionallySizedBox(
          widthFactor: 1,
          child: Stack(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Icon(Icons.close, size: 26, color: backBtnColor),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                child: Center(
                  child: Text(_genTittle(widget.title),
                      style: TextStyle(color: backBtnColor, fontSize: 20)),
                ),
              )
            ],
          ),
        ),
      );
    }
  }

  _genTittle(String title) {
    if (title != null) {
      int length = widget.title.length;
      if (length == 0) {
        return '';
      }
      if (length < 10) {
        return title;
      } else {
        return title.substring(0, 10) + '...';
      }
    } else {
      return '';
    }
  }
}
