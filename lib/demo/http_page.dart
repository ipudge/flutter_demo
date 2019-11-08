import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "dart:convert";
 
class HttpApp extends StatelessWidget {
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
        body: HttpPage(),
      ),
    );
  }
}

class HttpPage extends StatefulWidget {
  HttpPage({Key key}) : super(key: key);

  _HttpPageState createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
  String dataDesc = '';

  Future<CommonModel> getCommonModel() async {
    final response = await http.get('http://www.devio.org/io/flutter_app/json/test_common_model.json');
    final result = json.decode(response.body);
    return CommonModel.fromJson(result);
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Column(
         children: <Widget>[
           GestureDetector(
             child: Text('点我'),
             onTap: () {
               getCommonModel().then((CommonModel data) {
                 setState(() {
                   dataDesc = 'icon: ${data.icon}\ntitle: ${data.title}\nurl: ${data.url}\nstatusBarColor: ${data.statusBarColor}\nhideAppBar: ${data.hideAppBar}\n';
                 });
               });
             },
           ),
           Text(dataDesc)
         ],
       ),
    );
  }
}

class CommonModel {
  String icon;
  String title;
  String url;
  String statusBarColor;
  bool hideAppBar;

  CommonModel({
    this.icon,
    this.title,
    this.url,
    this.statusBarColor,
    this.hideAppBar,
  });

  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
      icon: json['icon'],
      title: json['title'],
      url: json['url'],
      statusBarColor: json['statusBarColor'],
      hideAppBar: json['hideAppBar'],
    );
  }
}



