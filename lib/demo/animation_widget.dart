import 'package:flutter/material.dart';

class AnimationWidgetApp extends StatelessWidget {
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

class FlutterLogoWidget extends AnimatedWidget {
  FlutterLogoWidget({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
        child: Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: animation.value,
      height: animation.value,
      child: FlutterLogo(),
    ));
  }
}

class AnimationPage extends StatefulWidget {
  AnimationPage({Key key}) : super(key: key);

  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
    super.initState();
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogoWidget(animation: animation);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
