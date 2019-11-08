import 'package:flutter/material.dart';

class GesturePageApp extends StatelessWidget {
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
        body: GesturePage(),
      ),
    );
  }
}

class GesturePage extends StatefulWidget {
  GesturePage({Key key}) : super(key: key);

  _GesturePageState createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage> {
  double moveX = 0;
  double moveY = 0;
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
        widthFactor: 1,
        child: Stack(children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                child: GestureDetector(
                  onTap: () => _printMsg('单击'),
                  onDoubleTap: () => _printMsg('双击'),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(color: Colors.blueAccent),
                    child: Text('点我',
                        style: TextStyle(fontSize: 36, color: Colors.red)),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: moveX,
            top: moveY,
            child: GestureDetector(
              onPanUpdate: (e) => _doMove(e),
              child: Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(36)),
              ),
            ),
          )
        ]));
  }

  void _printMsg(String msg) {
    print('$msg  haha');
  }

  void _doMove(e) {
    setState(() {
      moveX += e.delta.dx;
      moveY += e.delta.dy;
    });
    print(e);
  }
}
