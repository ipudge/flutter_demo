import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchPage extends StatelessWidget {
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
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: _launchURL,
              child: Text('Show Flutter homepage'),
            ),
            RaisedButton(
              onPressed: _lanchMap,
              child: Text('Show Map'),
            )
          ],
        )),
      ),
    );
  }

  void _launchURL() async {
    const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _lanchMap() async {
    const url = 'geo:52.32.4.917';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      const url = 'http://maps.apple.com/?ll=52.32.4.917';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }
}
