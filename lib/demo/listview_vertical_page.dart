import 'package:flutter/material.dart';
 
class ListViewVerticalApp extends StatelessWidget {
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
    return ListView(
      children: _getCityItems(),
    );
  }

  List<Widget> _getCityItems() {
    return citys.map((item) => _genItem(item)).toList();
  }

  Widget _genItem(item) {
    return Container(
      height: 160,
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(color: Colors.teal),
      alignment: Alignment.center,
      child: Text(item,
        style: TextStyle(color: Colors.white, fontSize: 20)
      ),
    );
  }
}