import 'package:flutter/material.dart';

class ResPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GesturePage',
      home: Scaffold(
        appBar: AppBar(
          title: Text('GesturePage'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                width: 100,
                height: 100,
                image: AssetImage('images/avatar.png'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

