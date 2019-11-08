import 'package:flutter/material.dart';

class ListViewHorizontalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          )
        ),
        body: ListViewPage(),
      ),
    );
  }
}

class ListViewPage extends StatefulWidget {
  ListViewPage({Key key}) : super(key: key);

  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  final List citys = ['北京', '上海', '杭州', '深圳', '湖北', '三湖'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: _getCityItems(),
      ),
    );
  }

  List<Widget> _getCityItems() {
    return citys.map((item) => _genItem(item)).toList();
  }

  Widget _genItem(item) {
    return Container(
      width: 160,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(color: Colors.teal),
      alignment: Alignment.center,
      child: Text(item, style: TextStyle(color: Colors.white, fontSize: 20)),
    );
  }
}
