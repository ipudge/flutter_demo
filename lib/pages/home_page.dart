import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:haha/dao/home_dao.dart';
import 'package:haha/model/common_model.dart';
import 'package:haha/model/grid_nav_model.dart';
import 'package:haha/model/home_model.dart';
import 'package:haha/model/sales_box_model.dart';
import 'package:haha/pages/search_page.dart';
import 'package:haha/widget/grid_nav.dart';
import 'package:haha/widget/loading_container.dart';
import 'package:haha/widget/local_nav.dart';
import 'package:haha/widget/sales_box.dart';
import 'package:haha/widget/search_bar.dart';
import 'package:haha/widget/sub_nav.dart';
import 'package:haha/widget/web_view.dart';

const APPBAR_SCROLL_OFFSET = 100;
const SEARCH_BAR_DEFAULT_TEXT = '网红打卡地 景点 酒店 美食';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double appBarAlpha = 0;
  List<CommonModel> localNavList = [];
  List<CommonModel> subNavList = [];
  List<CommonModel> bannerList = [];
  GridNavModel gridNav;
  SalesBoxModel salesBox;
  bool isLoading = true;

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

  Future<Null> _handleRefresh() async {
    try {
      final HomeModel homeModel = await HomeDao.fetchData();
      setState(() {
        localNavList = homeModel.localNavList;
        subNavList = homeModel.subNavList;
        bannerList = homeModel.bannerList;
        gridNav = homeModel.gridNav;
        salesBox = homeModel.salesBox;
        isLoading = false;
      });
    } catch (e) {
      print(e.toString());
      setState(() {
        isLoading = false;
      });
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    _handleRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingContainer(
        child: Stack(
          children: <Widget>[
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: RefreshIndicator(
                child: NotificationListener(
                  onNotification: (scrollNotification) {
                    if (scrollNotification is ScrollUpdateNotification &&
                        scrollNotification.depth == 0) {
                      _onScroll(scrollNotification.metrics.pixels);
                    }
                  },
                  child: _content,
                ),
                onRefresh: _handleRefresh,
              ),
            ),
            _appBar
          ],
        ),
        isLoading: isLoading,
      ),
    );
  }

  Widget get _content {
    return ListView(
      children: <Widget>[
        _banner,
        Padding(
          child: LocalNav(
            localNavList: localNavList,
          ),
          padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
        ),
        Padding(
          child: GridNav(
            gridNav: gridNav,
          ),
          padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
        ),
        Padding(
          child: SubNav(
            subNavList: subNavList,
          ),
          padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
        ),
        Container(
          child: SalesBox(
            salesBox: salesBox,
          ),
          margin: EdgeInsets.only(top: 10),
        )
      ],
    );
  }

  Widget get _banner {
    return Container(
      height: 160,
      child: Swiper(
        autoplay: true,
        itemCount: bannerList.length,
        itemBuilder: (context, index) {
          CommonModel model = bannerList[index];
          return GestureDetector(
            child: Image.network(
              model.icon,
              fit: BoxFit.fill,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WebView(
                            url: model.url,
                            statusBarColor: model.statusBarColor,
                            hideAppBar: model.hideAppBar,
                            title: model.title,
                          )));
            },
          );
        },
        pagination: SwiperPagination(),
      ),
    );
  }

  Widget get _appBar {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              //AppBar渐变遮罩背景
              colors: [Color(0x66000000), Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            height: 80.0,
            decoration: BoxDecoration(
              color: Color.fromARGB((appBarAlpha * 255).toInt(), 255, 255, 255),
            ),
            child: SearchBar(
              searchBarType: appBarAlpha > 0.2
                  ? SearchBarType.homeLight
                  : SearchBarType.home,
              inputBoxClick: _jumpToSearch,
              speakClick: _jumpToSpeak,
              defaultText: SEARCH_BAR_DEFAULT_TEXT,
              leftButtonClick: () {},
            ),
          ),
        ),
        Container(
            height: appBarAlpha > 0.2 ? 0.5 : 0,
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 0.5)]))
      ],
    );
  }

  _jumpToSearch() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SearchPage(
        hint: SEARCH_BAR_DEFAULT_TEXT,
      );
    }));
  }
  _jumpToSpeak() {}
}
