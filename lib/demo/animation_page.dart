import 'package:flutter/material.dart';
 
class AnimationApp extends StatelessWidget {
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
        body: AnimationPage(),
      ),
    );
  }
}

class AnimationPage extends StatefulWidget {
  AnimationPage({Key key}) : super(key: key);

  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> with SingleTickerProviderStateMixin{
  Animation<double> animation;
  AnimationController controller;
  AnimationStatus _animationStatus;
  double _animationValue;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
    ..addStatusListener((AnimationStatus status) {
      setState(() {
        _animationStatus = status;
      });
    })
    ..addListener(() {
      setState(() {
        _animationValue = animation.value;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
       child: Column(
         children: <Widget>[
           GestureDetector(
             child: Text('start'),
             onTap: () {
               controller.reset();
               controller.forward();
             },
           ),
           Text('value: $_animationValue'),
           Text('status: $_animationStatus'),
           Container(
             width: _animationValue,
             height: _animationValue,
             child: FlutterLogo(),
           )
         ],
       ),
    );
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}