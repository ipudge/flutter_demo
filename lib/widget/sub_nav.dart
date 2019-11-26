import 'package:flutter/material.dart';
import 'package:haha/model/common_model.dart';
import 'package:haha/widget/web_view.dart';

class SubNav extends StatelessWidget {
  final List<CommonModel> subNavList;
  const SubNav({Key key, @required this.subNavList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6)),
      child: _genSubNav(context),
    );
  }

  Widget _genSubNav(BuildContext context) {
    if (subNavList == null) return null;
    List<Widget> widgets = [];
    subNavList.forEach((model) {
      widgets.add(_genItem(context, model));
    });
    final int index = (subNavList.length / 2 + 0.5).toInt();
    return Column(
      children: <Widget>[
        Row(
          children: widgets.sublist(0, index),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        Container(
          margin: EdgeInsets.only(top: 8),
          child: Row(
            children: widgets.sublist(index),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        )
      ],
    );
  }

  Widget _genItem(BuildContext context, CommonModel model) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WebView(
                        url: model.url,
                        statusBarColor: model.statusBarColor,
                        hideAppBar: model.hideAppBar,
                      )));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              model.icon,
              height: 24,
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(model.title, style: TextStyle(fontSize: 12)),
            )
          ],
        ),
      ),
    );
  }
}
