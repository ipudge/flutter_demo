import 'package:flutter/material.dart';
import 'package:haha/dao/search_dao.dart';
import 'package:haha/model/search_model.dart';
import 'package:haha/widget/search_bar.dart';
import 'package:haha/widget/web_view.dart';

const PATH_ALL = [
  'channelgroup',
  'channelgs',
  'channelplane',
  'channeltrain',
  'cruise',
  'district',
  'food',
  'hotel',
  'huodong',
  'shop',
  'sight',
  'ticket',
  'travelgroup'
];
const String URL =
    'https://m.ctrip.com/restapi/h5api/searchapp/search?source=mobileweb&action=autocomplete&contentType=json&keyword=';

class SearchPage extends StatefulWidget {
  final bool hideLeft;
  final String defaultText;
  final String hint;
  final String searchUrl;
  SearchPage(
      {Key key,
      this.hideLeft,
      this.defaultText,
      this.hint,
      this.searchUrl = URL})
      : super(key: key);

  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchModel searchModel;
  String keyword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _appBar(),
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: searchModel?.data?.length ?? 0,
                itemBuilder: (BuildContext context, int position) =>
                    _item(position),
              ),
            ),
          )
        ],
      ),
    );
  }

  _onTextChange(String text) {
    keyword = text;
    if (text.length == 0) {
      setState(() {
        searchModel = null;
      });
    } else {
      String searchUrl = widget.searchUrl + text;
      SearchDao.fetchData(searchUrl, text).then((SearchModel model) {
        if (model.keyword == keyword) {
          setState(() {
            searchModel = model;
          });
        }
      }).catchError((e) {
        print(e.toString());
      });
    }
  }

  _appBar() {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              //AppBar渐变遮罩背景
              colors: [Color(0x66000000), Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            padding: EdgeInsets.only(top: 20),
            height: 80,
            child: SearchBar(
              hideLeft: widget.hideLeft,
              defaultText: widget.defaultText,
              hint: widget.hint,
              leftButtonClick: () {
                Navigator.pop(context);
              },
              onChanged: _onTextChange,
            ),
          ),
        )
      ],
    );
  }

  _item(int index) {
    if (searchModel == null && searchModel.data == null) return null;
    SearchItem searchItem = searchModel.data[index];
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(color: Color(0xfff2f2f2), width: 0.3))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(1),
              child: Image(
                  width: 26,
                  height: 26,
                  image: AssetImage(_imageType(searchItem.type))),
            ),
            Column(
              children: <Widget>[
                Container(
                  width: 300,
                  child: _genTitle(searchItem),
                ),
                Container(
                  width: 300,
                  margin: EdgeInsets.only(top: 5),
                  child: _genSubTitle(searchItem),
                )
              ],
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    WebView(url: searchItem.url, title: searchItem.word)));
      },
    );
  }

  _imageType(String type) {
    if (type == null) return 'images/type_travelgroup.png';
    String path = 'travelgroup';
    for (final tmpPath in PATH_ALL) {
      if (type.contains(tmpPath)) {
        path = tmpPath;
        break;
      }
    }
    return 'images/type_$path.png';
  }

  _genTitle(SearchItem item) {
    List<TextSpan> list = [];
    list.add(_genSplitText(item.word, keyword));
    list.add(TextSpan(
        text: ' ' + (item.districtname ?? '') + ' ' + (item.zonename ?? ''),
        style: TextStyle(fontSize: 16, color: Colors.grey)));
    return RichText(
      text: TextSpan(children: list),
    );
  }

  _genSplitText(String word, String keyword) {
    List<String> arrs = word.split(keyword);
    List<TextSpan> list = [];
    TextStyle normalStyle = TextStyle(fontSize: 16, color: Colors.black87);
    TextStyle keywordStyle = TextStyle(fontSize: 16, color: Colors.orange);
    for (var i = 0; i < arrs.length; i++) {
      if ((i + 1) % 2 == 0) {
        list.add(TextSpan(text: keyword, style: keywordStyle));
      }
      var str = arrs[i];
      if (str != null && str.length != 0) {
        list.add(TextSpan(text: str, style: normalStyle));
      }
    }
    return TextSpan(children: list);
  }

  _genSubTitle(SearchItem item) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: item.price ?? '',
            style: TextStyle(fontSize: 16, color: Colors.orange)),
        TextSpan(
            text: ' ' + (item.star ?? ''),
            style: TextStyle(fontSize: 12, color: Colors.grey))
      ]),
    );
  }
}
