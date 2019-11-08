import 'package:flutter/material.dart';
import 'package:haha/pages/home_page.dart';
import 'package:haha/pages/my_page.dart';
import 'package:haha/pages/search_page.dart';
import 'package:haha/pages/travel_page.dart';

class NavigatorApp extends StatefulWidget {
  NavigatorApp({Key key}) : super(key: key);

  _NavigatorAppState createState() => _NavigatorAppState();
}

class _NavigatorAppState extends State<NavigatorApp> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[HomePage(), SearchPage(), TravelPage(), MyPage()],
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(title: Text('首页'), icon: Icon(Icons.home)),
          BottomNavigationBarItem(title: Text('搜索'), icon: Icon(Icons.search)),
          BottomNavigationBarItem(
              title: Text('旅游'), icon: Icon(Icons.camera_alt)),
          BottomNavigationBarItem(
              title: Text('我的'), icon: Icon(Icons.account_circle)),
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        currentIndex: _currentIndex,
        onTap: (index) {
          _pageController.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
