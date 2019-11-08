import 'package:flutter/material.dart';
 
class AppLifecycleApp extends StatelessWidget {
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

class _LifecycleState extends State<Lifecycle> with WidgetsBindingObserver{
  @override
  Widget build(BuildContext context) {
    print('------build------');
    return Column(
      children: <Widget>[
        Text('123')
      ],
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    print('state == $state');

    if (state == AppLifecycleState.paused) {
      print('app进入后台');
    } else if (state == AppLifecycleState.resumed) {
      print('app进去前台');
    } else if (state == AppLifecycleState.inactive) {
      // 不常用非活动状态  比如来了个电话
    } else if (state == AppLifecycleState.suspending) {
      // 应用挂起 仅在android
    }
  } 

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}