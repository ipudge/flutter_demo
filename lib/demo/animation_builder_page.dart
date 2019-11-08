import 'package:flutter/material.dart';
 
class AnimmationBuilderApp extends StatelessWidget {
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
        body: AnimmationBuilderPage(),
      ),
    );
  }
}

class FlutterLogoContainer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: FlutterLogo(),
      );
  }
}

class GrowTransition extends StatelessWidget{
  const GrowTransition({Key key, this.animation, this.child}) : super(key: key);
  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedBuilder(
      builder: (context, child) => Container(
        child: child,
        width: animation.value,
        height: animation.value,
      ),
      child: child,
      animation: animation,
    );
  }
  
}

class AnimmationBuilderPage extends StatefulWidget {
  AnimmationBuilderPage({Key key}) : super(key: key);

  _AnimmationBuilderPageState createState() => _AnimmationBuilderPageState();
}

class _AnimmationBuilderPageState extends State<AnimmationBuilderPage> with SingleTickerProviderStateMixin{
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
    super.initState();
    controller.forward();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GrowTransition(animation: animation, child: FlutterLogoContainer(),);
  }
}