import 'package:flutter/material.dart';
import 'package:haha/model/common_model.dart';
import 'package:haha/widget/web_view.dart';

class LocalNav extends StatelessWidget {
  final List<CommonModel> localNavList;
  const LocalNav({Key key, @required this.localNavList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6)),
      child: _genLocalNav(context),
    );
  }

  Widget _genLocalNav(BuildContext context) {
    if (localNavList == null) return null;
    List<Widget> widgets = [];
    localNavList.forEach((model) {
      widgets.add(_genItem(context, model));
    });
    return Row(
      children: widgets,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }

  Widget _genItem(BuildContext context, CommonModel model) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => WebView(url: model.url, statusBarColor: model.statusBarColor, hideAppBar: model.hideAppBar,)
        ));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
            model.icon,
            height: 32,
          ),
          Text(model.title, style: TextStyle(fontSize: 12))
        ],
      ),
    );
  }
}
