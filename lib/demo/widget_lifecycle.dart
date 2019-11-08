import 'package:flutter/material.dart';
 
class LifecycleApp extends StatelessWidget {
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
        body: Lifecycle(),
      ),
    );
  }
}

class Lifecycle extends StatefulWidget {
  Lifecycle({Key key}) : super(key: key);

  _LifecycleState createState() => _LifecycleState();
}

class _LifecycleState extends State<Lifecycle> {
  int a = 1;
  @override
  Widget build(BuildContext context) {
    print('------build------');
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text('haha'),
          onPressed: () {
            setState(() {
              a++;
            });
          },
        ),
        Text(a.toString())
      ],
    );
  }

  @override
  void initState() {
    print('------initState------');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('------didChangeDependencies------');
    super.didChangeDependencies();
  }

  @override
  void reassemble() {
    print('------reassemble------');
    super.reassemble();
  }
  @override
  void deactivate() {
    print('------deactivate------');
    super.deactivate();
  }
  @override
  void didUpdateWidget(Lifecycle oldWidget) {
     print('------didUpdateWidget------');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
     print('------dispose------');
    super.dispose();
  }
}