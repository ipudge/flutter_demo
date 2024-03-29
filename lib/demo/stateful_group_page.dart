import 'package:flutter/material.dart';

class StatefulGroupPageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: StatefulGroupPage(),
    );
  }
}

class StatefulGroupPage extends StatefulWidget {
  StatefulGroupPage({Key key}) : super(key: key);

  _StatefulGroupPageState createState() => _StatefulGroupPageState();
}

class _StatefulGroupPageState extends State<StatefulGroupPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('点我'),
        onPressed: null,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Colors.blue,
              ),
              title: Text('首页')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.list,
                color: Colors.blue,
              ),
              title: Text('列表'))
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: Center(
        child: _currentIndex == 0
            ? RefreshIndicator(
                child: ListView(children: <Widget>[
                  ClipOval(
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child:
                          Image.network('http://www.devio.org/img/avatar.png'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Opacity(
                        opacity: 0.6,
                        child: Image.network(
                          'http://www.devio.org/img/avatar.png',
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                  ),
                  Image.network(
                    'http://www.devio.org/img/avatar.png',
                    width: 100,
                    height: 100,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        hintText: '请输入',
                        hintStyle: TextStyle(fontSize: 15)),
                  ),
                  Container(
                    height: 100,
                    margin: EdgeInsets.all(10),
                    child: PhysicalModel(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(6),
                      clipBehavior: Clip.antiAlias,
                      child: PageView(
                        children: <Widget>[
                          _item('Page1', Colors.purple),
                          _item('Page2', Colors.black),
                          _item('Page3', Colors.red)
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: Container(
                          decoration: BoxDecoration(color: Colors.greenAccent),
                          child: Text('haha'),
                        ),
                      )
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Image.network(
                        'http://www.devio.org/img/avatar.png',
                        width: 100,
                        height: 100,
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        child: Image.network(
                          'http://www.devio.org/img/avatar.png',
                          width: 36,
                          height: 36,
                        ),
                      )
                    ],
                  ),
                  Wrap(
                    children: <Widget>[
                      _chip('hahahahaah'),
                      _chip('hahahahaah11111111'),
                      _chip('hahahahaah1'),
                      _chip('hahahahaah112'),
                      _chip('hahahahaah11345'),
                    ],
                  )
                ]),
                onRefresh: _handleRefresh,
              )
            : Row(
                children: <Widget>[
                  Text('列表'),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(color: Colors.red),
                      child: Text('拉伸填满高度'),
                    ),
                  )
                ],
              ),
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 2000));
    return null;
  }

  Widget _item(String title, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(title, style: TextStyle(fontSize: 20, color: Colors.white)),
    );
  }

  Widget _chip(String title) {
    return Chip(
      avatar: CircleAvatar(
        backgroundColor: Colors.blue.shade900,
        child: Text(
          title.substring(0, 1),
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      label: Text(title),
    );
  }
}
