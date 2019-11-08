import 'package:flutter/material.dart';
import 'package:haha/model/common_model.dart';
import 'package:haha/model/grid_nav_model.dart';

import 'web_view.dart';

class GridNav extends StatelessWidget {
  GridNavModel gridNav;
  GridNav({Key key, this.gridNav}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(6),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: _genItems(context),
      ),
    );
  }

  List<Widget> _genItems(BuildContext context) {
    List<Widget> widgets = [];
    if (gridNav == null) return widgets;
    if (gridNav.hotel != null) {
      widgets.add(_genItem(context, gridNav.hotel, true));
    }
    if (gridNav.travel != null) {
      widgets.add(_genItem(context, gridNav.travel, false));
    }
    if (gridNav.flight != null) {
      widgets.add(_genItem(context, gridNav.flight, false));
    }
    return widgets;
  }

  Widget _genItem(BuildContext context, NavModel item, isTop) {
    List<Widget> widgets = [];
    widgets.add(_genMainItem(context, item.mainItem));
    widgets.add(_genDoubleItems(context, item.item1, item.item2));
    widgets.add(_genDoubleItems(context, item.item1, item.item3));
    List<Widget> expandWidgets = [];
    widgets.forEach((item) {
      expandWidgets.add(Expanded(
        flex: 1,
        child: item,
      ));
    });
    final Color startColor = Color(int.parse('0xff' + item.startColor));
    final Color endColor = Color(int.parse('0xff' + item.endColor));
    return Container(
      height: 88,
      child: Row(
        children: expandWidgets,
      ),
      margin: isTop ? null : EdgeInsets.only(top: 3),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [startColor, endColor])),
    );
  }

  Widget _genMainItem(BuildContext context, CommonModel item) {
    return _wrapGestureDetector(
        context,
        Stack(
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            Image.network(
              item.icon,
              fit: BoxFit.contain,
              height: 88,
              width: 121,
              alignment: AlignmentDirectional.bottomEnd,
            ),
            Container(
              margin: EdgeInsets.only(top: 11),
              child: Text(item.title,
                  style: TextStyle(fontSize: 14, color: Colors.white)),
            )
          ],
        ),
        item);
  }

  // Widget _genDoubleItems(
  //     BuildContext context, CommonModel topItem, CommonModel bottomItem) {
  //   return FractionallySizedBox(
  //     widthFactor: 1,
  //     child: Container(
  //       decoration: BoxDecoration(
  //           border: Border(left: BorderSide(color: Colors.white, width: 0.8))),
  //       child: Column(
  //         children: <Widget>[
  //           _genInnerItem(context, topItem, true),
  //           _genInnerItem(context, bottomItem, false),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Widget _genInnerItem(BuildContext context, CommonModel item, bool isFirst) {
  //   return _wrapGestureDetector(
  //       context,
  //       Container(
  //         child: Expanded(
  //           child: Center(
  //             child: Text(item.title,
  //                 style: TextStyle(color: Colors.white, fontSize: 14)),
  //           ),
  //         ),
  //         decoration: BoxDecoration(
  //             border: Border(
  //                 bottom: isFirst
  //                     ? BorderSide(color: Colors.white, width: 0.8)
  //                     : BorderSide.none)),
  //       ),
  //       item);
  // }

  Widget _genDoubleItems(
      BuildContext context, CommonModel topItem, CommonModel bottomItem) {
    return Column(
      children: <Widget>[
        Expanded(
          child: _genInnerItem(context, topItem, true),
        ),
        Expanded(
          child: _genInnerItem(context, bottomItem, false),
        )
      ],
    );
  }

  Widget _genInnerItem(BuildContext context, CommonModel item, bool first) {
    BorderSide borderSide = BorderSide(width: 0.8, color: Colors.white);
    return FractionallySizedBox(
      //撑满父布局的宽度
      widthFactor: 1,
      child: Container(
        decoration: BoxDecoration(
            border: Border(
          left: borderSide,
          bottom: first ? borderSide : BorderSide.none,
        )),
        child: _wrapGestureDetector(
            context,
            Center(
              child: Text(
                item.title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
            item),
      ),
    );
  }
  Widget _wrapGestureDetector(
      BuildContext context, Widget widget, CommonModel model) {
    return GestureDetector(
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
      child: widget,
    );
  }
}
