import 'package:flutter/material.dart';

const CITY_NAMES = {
  '北京': ['东城区', '西城区', '丰台区', '大兴区'],
  '杭州': ['上城区', '下城区']
};

class ExpansionTitleApp extends StatelessWidget {
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
        body: ExpansionTitlePage(),
      ),
    );
  }
}

class ExpansionTitlePage extends StatefulWidget {
  ExpansionTitlePage({Key key}) : super(key: key);

  _ExpansionTitlePageState createState() => _ExpansionTitlePageState();
}

class _ExpansionTitlePageState extends State<ExpansionTitlePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _getItemList(),
    );
  }

  List<Widget> _getItemList() {
    List<Widget> widgets = [];
    CITY_NAMES.keys.forEach((key) {
      widgets.add(_genItem(key, CITY_NAMES[key]));
    });
    return widgets;
  }

  Widget _genItem(String key, List<String> list) {
    return ExpansionTile(
        title: Text(key),
        children: list.map((item) => _genExpansionTileChild(item)).toList());
  }

  Widget _genExpansionTileChild(String city) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        height: 50,
        margin: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(color: Colors.black),
        child: Text(city, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
