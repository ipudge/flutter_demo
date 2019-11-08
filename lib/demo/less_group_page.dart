import 'package:flutter/material.dart';

class LessGroupPage extends StatelessWidget {
  TextStyle textStyle = TextStyle(fontSize: 20);

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
          ),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Text('i am child', style: textStyle),
                Icon(
                  Icons.android,
                  size: 50,
                  color: Colors.red,
                ),
                CloseButton(),
                BackButton(),
                Chip(
                  avatar: Icon(Icons.phone),
                  label: Text('StatelessWidget与基础组件'),
                ),
                Divider(
                  height: 10,
                  indent: 10,
                  color: Colors.orange,
                ),
                Card(
                  color: Colors.blue,
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text('i am child', style: textStyle),
                  ),
                ),
                AlertDialog(
                  title: Text('haha'),
                  content: Text('haha'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
