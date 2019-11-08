import 'package:flutter/material.dart';

const CITY_NAMES = ['北京', '上海', '武汉', '深圳', '广州'];

class GridViewApp extends StatelessWidget {
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
            )),
        body: GridViewPage(),
      ),
    );
  }
}

class GridViewPage extends StatefulWidget {
  GridViewPage({Key key}) : super(key: key);

  _GridViewPageState createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: _genItemList(),
    );
  }

  List<Widget> _genItemList() {
    return CITY_NAMES.map((item) => _genItem(item)).toList();
  }

  Widget _genItem(item) {
    return Container(
      height: 60,
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(color: Colors.blue),
      child: Text(item, style: TextStyle(color: Colors.white, fontSize: 20)),
    );
  }
}
