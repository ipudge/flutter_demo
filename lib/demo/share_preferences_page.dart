import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePreferencesApp extends StatelessWidget {
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
        body: SharePreferencesPage(),
      ),
    );
  }
}

class SharePreferencesPage extends StatefulWidget {
  SharePreferencesPage({Key key}) : super(key: key);

  _SharePreferencesPageState createState() => _SharePreferencesPageState();
}

class _SharePreferencesPageState extends State<SharePreferencesPage> {
  String _str = '';
  int _dataNum = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text('设置值'),
            onPressed: _handleSetData,
          ),
          RaisedButton(
            child: Text('获取值'),
            onPressed: _handleGetData,
          ),
          RaisedButton(
            child: Text('清空值'),
            onPressed: _handleDelData,
          ),
          Text(_str),
          Text(_dataNum.toString())
        ],
      ),
    );
  }

  _handleSetData() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      _str += ' 1';
    });
    final num1 = (preferences.getInt('num1') ?? 0) + 1;
    preferences.setInt('num1', num1);
  }

  _handleGetData() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final num1 = preferences.getInt('num1') ?? 0;
    setState(() {
      _dataNum = num1;
    });
  }

  _handleDelData() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('num1');
  }
}