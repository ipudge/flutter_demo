import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:haha/dao/home_dao.dart';
import 'package:haha/model/common_model.dart';
import 'package:haha/model/grid_nav_model.dart';
import 'package:haha/model/home_model.dart';
import 'package:haha/widget/grid_nav.dart';
import 'package:haha/widget/local_nav.dart';
const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _images = [
    "http://www.devio.org/io/flutter_app/img/banner/100h10000000q7ght9352.jpg",
    "https://dimg04.c-ctrip.com/images/300h0u000000j05rnD96B_C_500_280.jpg",
    "https://dimg04.c-ctrip.com/images/300h0u000000j05rnD96B_C_500_280.jpg"
  ];
  String str = 'haha';
  double appBarAlpha = 0;
  List<CommonModel> localNavList = []; 
  GridNavModel gridNav;

  _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
  }
  
  getHomeData() async {
    try {
      final HomeModel homeModel = await HomeDao().fetchData();
      setState(() {
        localNavList = homeModel.localNavList;
        gridNav = homeModel.gridNav;
        str = json.encode(homeModel);
      });
    } catch (e) {
      setState(() {
        str = e.toString();
      });
    }
  }

  @override
  void initState()  {
    super.initState();
    getHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: NotificationListener(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollUpdateNotification && scrollNotification.depth == 0) {
                _onScroll(scrollNotification.metrics.pixels);
              }
            },
            child: ListView(
            children: <Widget>[
              Container(
                height: 160,
                child: Swiper(
                  autoplay: true,
                  itemCount: _images.length,
                  itemBuilder: (context, index) {
                    return Image.network(
                      _images[index],
                      fit: BoxFit.fill,
                    );
                  },
                  pagination: SwiperPagination(),
                ),
              ),
              Padding(
                child: LocalNav(localNavList: localNavList,),
                padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
              ),
              Padding(
                child: GridNav(gridNav: gridNav,),
                padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
              ),
              Container(
                height: 800,
                child: ListTile(
                  title: Text(str),
                ),
              )
            ],
          ),
          ),
        ),
        Opacity(
          opacity: appBarAlpha,
          child: Container(
            height: 80,
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text('首页', style: TextStyle(color: Colors.black),),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
