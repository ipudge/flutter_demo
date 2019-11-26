import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:haha/model/common_model.dart';
import 'package:haha/model/sales_box_model.dart';
import 'package:haha/widget/web_view.dart';

class SalesBox extends StatelessWidget {
  final SalesBoxModel salesBox;
  const SalesBox({Key key, @required this.salesBox}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _genSalesBox(context),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
    );
  }

  Widget _genDouble(BuildContext context, CommonModel leftCard,
      CommonModel rightCard, bool isBig, bool isLast) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _genItem(context, leftCard, isBig, false, isLast),
        _genItem(context, rightCard, isBig, true, isLast),
      ],
    );
  }

  Widget _genItem(BuildContext context, CommonModel item, bool isBig,
      bool isRight, bool isLast) {
    BorderSide borderSide = BorderSide(width: 0.8, color: Color(0xfff2f2f2));
    return GestureDetector(
      child: Container(
          decoration: BoxDecoration(
              border: Border(
                  left: isRight ? borderSide : BorderSide.none,
                  bottom: isLast ? BorderSide.none : borderSide)),
          child: Image.network(
            item.icon,
            width: MediaQuery.of(context).size.width / 2 - 10,
            fit: BoxFit.fill,
            height: isBig ? 129 : 80,
          )),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebView(
                      url: item.url,
                      statusBarColor: item.statusBarColor,
                      hideAppBar: item.hideAppBar,
                      title: item.title,
                    )));
      },
    );
  }

  Widget _genSalesBox(BuildContext context) {
    if (salesBox == null) return null;

    return Column(
      children: <Widget>[
        Container(
          height: 44,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1, color: Color(0xfff9f9f9)))),
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.network(
                salesBox.icon,
                height: 15,
                fit: BoxFit.fill,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WebView(
                                url: salesBox.moreUrl,
                                title: '更多活动',
                              )));
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(10, 1, 8, 1),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                          colors: [Color(0xffff4e63), Color(0xffff6cc9)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight)),
                  child: Text('更多优惠活动',
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              )
            ],
          ),
        ),
        _genDouble(context, salesBox.bigCard1, salesBox.bigCard2, true, false),
        _genDouble(
            context, salesBox.smallCard1, salesBox.smallCard2, false, false),
        _genDouble(
            context, salesBox.smallCard3, salesBox.smallCard4, false, true)
      ],
    );
  }
}
