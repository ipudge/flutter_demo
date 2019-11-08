import 'package:flutter/material.dart';
 
class ScrollRefreshApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: ScrollRefreshPage(),
      ),
    );
  }
}

class ScrollRefreshPage extends StatefulWidget {
  ScrollRefreshPage({Key key}) : super(key: key);

  _ScrollRefreshPageState createState() => _ScrollRefreshPageState();
}

class _ScrollRefreshPageState extends State<ScrollRefreshPage> {
  ScrollController _scrollController = ScrollController();
  List cityNames = ['北京', '上海', '广州', '深圳', '武汉', '上海', '广州', '深圳', '武汉'];
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator( 
      onRefresh: _handleRefresh,
      child: ListView(
        controller: _scrollController,
        children: _genItemList(),
      ),
    );
  }

  List<Widget> _genItemList() {
    return cityNames.map((item) => _genItem(item)).toList();
  }
  Widget _genItem(item) {
    return Container(
      height: 160,
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(color: Colors.teal),
      child: Text(item,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
  Future<Null> _handleRefresh() async{
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      cityNames = cityNames.reversed.toList();
    });
    return null;
  }

  _loadData() async{
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      cityNames.add('三湖');
    });
    isLoading = false;
  }

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels > _scrollController.position.maxScrollExtent && !isLoading) {
        isLoading = true;
        _loadData();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}