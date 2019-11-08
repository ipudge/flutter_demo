import 'package:flutter/material.dart';

import 'demo/animation_builder_page.dart';
import 'demo/animation_page.dart';
import 'demo/animation_widget.dart';
import 'demo/app_lifecycle.dart';
import 'demo/expansion_title_page.dart';
import 'demo/func_learn.dart';
import 'demo/generic_learn.dart';
import 'demo/gesture_learn.dart';
import 'demo/grid_view_page.dart';
import 'demo/http_page.dart';
import 'demo/launch_page.dart';
import 'demo/less_group_page.dart';
import 'demo/listview_horizontal_page.dart';
import 'demo/listview_vertical_page.dart';
import 'demo/photo_app_page.dart';
import 'demo/scroll_refresh.dart';
import 'demo/share_preferences_page.dart';
import 'demo/widget_lifecycle.dart';
import 'demo/opp_learn.dart';
import 'demo/plugin_use.dart';
import 'demo/res_page.dart';
import 'demo/stateful_group_page.dart';
import 'navigator/navigator.dart';

void main() => runApp(DynammicTheme());

class DynammicTheme extends StatefulWidget {
  DynammicTheme({Key key}) : super(key: key);

  _DynammicThemeState createState() => _DynammicThemeState();
}

class _DynammicThemeState extends State<DynammicTheme> {
  Brightness _brightness = Brightness.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter必备Dart基础',
      theme: ThemeData(
        // fontFamily: 'RobotoThin',
        brightness: _brightness,
        primaryColor: Colors.blue
      ),
      routes: <String, WidgetBuilder>{
        'plugin': (BuildContext context) => PluginUse(),
        'less': (BuildContext context) => LessGroupPage(),
        'ful': (BuildContext context) => StatefulGroupPage(),
        'gesture': (BuildContext context) => GesturePageApp(),
        'resPage': (BuildContext context) => ResPage(),
        'launchPage': (BuildContext context) => LaunchPage(),
        'lifecycleApp': (BuildContext context) => LifecycleApp(),
        'appLifecycleApp': (BuildContext context) => AppLifecycleApp(),
        'photoApp': (BuildContext context) => PhotoApp(),
        'animationApp': (BuildContext context) => AnimationApp(),
        'animationWidgetApp': (BuildContext context) => AnimationWidgetApp(),
        'animmationBuilderApp': (BuildContext context) => AnimmationBuilderApp(),
        'navigatorApp': (BuildContext context) => NavigatorApp(),
        'httpApp': (BuildContext context) => HttpApp(),
        'sharePreferencesApp': (BuildContext context) => SharePreferencesApp(),
        'listViewHorizontalApp': (BuildContext context) => ListViewHorizontalApp(),
        'listViewVerticalApp': (BuildContext context) => ListViewVerticalApp(),
        'expansionTitleApp': (BuildContext context) => ExpansionTitleApp(),
        'gridViewApp': (BuildContext context) => GridViewApp(),
        'scrollRefreshApp': (BuildContext context) => ScrollRefreshApp(),
      },
      home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter必备Dart基础'),
          ),
          body: ListView(
            children: <Widget>[
              RaisedButton(
                child: Text('切换主题abc', style: TextStyle(fontFamily: 'RobotoThin',),),
                onPressed: () {
                  setState(() {
                    if (_brightness == Brightness.dark) {
                      _brightness = Brightness.light;
                    } else {
                      _brightness = Brightness.dark;
                    }
                  });
                },
              ),
              RouterNavigator(),
            ],
          )),
    );
  }
}

class RouterNavigator extends StatefulWidget {
  RouterNavigator({Key key}) : super(key: key);

  _RouterNavigatorState createState() => _RouterNavigatorState();
}

class _RouterNavigatorState extends State<RouterNavigator> {
  void _oppLearn() {
    print('------oppLearn----');
    Logger log1 = Logger();
    Logger log2 = Logger();
    print(log1 == log2);

    Student.doPrint('haha');
    Student stu = Student('清华', 'ah', 18);
    stu.school = '985';
    print(stu);

    StudyFlutter sf = StudyFlutter();
    sf.study();
  }

  bool byName = false;

  @override
  Widget build(BuildContext context) {
    // _oppLearn();
    // _functionLearn();
    _testGeneric();
    return Column(
      children: <Widget>[
        SwitchListTile(
          title: Text('${byName ? '' : '不'}通过路由跳转'),
          value: byName,
          onChanged: (value) {
            setState(() {
              byName = value;
            });
          },
        ),
        _item('跳转到插件页', PluginUse(), 'plugin'),
        _item('stateless demo 页', LessGroupPage(), 'less'),
        _item('stateful 与 layout 页', StatefulGroupPage(), 'ful'),
        _item('GesturePageApp 页', GesturePageApp(), 'gesture'),
        _item('resPage 页', ResPage(), 'resPage'),
        _item('launchPage 页', LaunchPage(), 'launchPage'),
        _item('lifecycleApp 页', LifecycleApp(), 'lifecycleApp'),
        _item('appLifecycleApp 页', AppLifecycleApp(), 'appLifecycleApp'),
        _item('photoApp 页', PhotoApp(), 'photoApp'),
        _item('animationApp 页', AnimationApp(), 'animationApp'),
        _item('animationWidgetApp 页', AnimationWidgetApp(), 'animationWidgetApp'),
        _item('animmationBuilderApp 页', AnimmationBuilderApp(), 'animmationBuilderApp'),
        _item('navigatorApp 页', NavigatorApp(), 'navigatorApp'),
        _item('httpApp 页', HttpApp(), 'httpApp'),
        _item('sharePreferencesApp 页', SharePreferencesApp(), 'sharePreferencesApp'),
        _item('listViewHorizontalApp 页', ListViewHorizontalApp(), 'listViewHorizontalApp'),
        _item('listViewVerticalApp 页', ListViewVerticalApp(), 'listViewVerticalApp'),
        _item('expansionTitleApp 页', ExpansionTitleApp(), 'expansionTitleApp'),
        _item('gridViewApp 页', GridViewApp(), 'gridViewApp'),
        _item('scrollRefreshApp 页', ScrollRefreshApp(), 'scrollRefreshApp'),
      ],
    );
  }

  void _functionLearn() {
    TestFunc testFunc = TestFunc();
    testFunc.start();
  }

  void _testGeneric() {
    TestGeneric testGeneric = TestGeneric();
    testGeneric.start();
  }

  Widget _item(String title, page, String routeName) {
    return Container(
      child: RaisedButton(
        child: Text(title),
        onPressed: () {
          if (byName) {
            Navigator.pushNamed(context, routeName);
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
          }
        },
      ),
    );
  }
}
