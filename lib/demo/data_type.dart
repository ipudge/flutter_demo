import 'package:flutter/material.dart';

class DateType extends StatefulWidget {
  DateType({Key key}) : super(key: key);

  _DateTypeState createState() => _DateTypeState();
}

class _DateTypeState extends State<DateType> {

  void _numType() {
    num num1 = -1.0;
    num num2 = 2;
    int int1 = 3;
    double d1 = 1.38;
    print("num:$num1 num:$num2 int:$int1 double:$d1");
    print(num1.abs());
    print(num1.toInt());
    print(num1.toDouble());
  }

  void _stringType() {
    String str1 = "haha";
    String str2 = "haha2";
    String str3 = 'str1:$str1 str2:$str2';
    String str4 = 'str1:' + str1 + 'str2:' + str2;
    String str5 = '常用数据类型，请查看控制台输出';
    print(str3);
    print(str4);

    print(str5.substring(1, 5));
    print(str5.indexOf('类型'));
    print(str5.startsWith('常'));
    print(str5.replaceAll(new RegExp(r'常'), 'aa'));
    print(str5.contains('常'));
    print(str5.split('常'));

  }
  void _boolType() {
    bool success = true;
    bool fail = false;
    print(success);
    print(fail);
    print(success || fail);
    print(success && fail);
  }
  void _listType() {
    print('----listType-----');
    List list = [1, 2, 3, 4, '集合'];
    print(list);
    List<int> list1 = [];
    List list2 = [];
    list2.add('list2');
    list2.addAll(list);
    print(list2);
    List list3 = List.generate(3, (index) => index * 2);
    print(list3);

    for(int i = 0; i < list.length; i++) {
      print(list[i]);
    }
    for(var o in list) {
      print(o);
    }
    list.forEach((o) {
      print(o);
    });
    list.remove(1);
    print(list);
    list.removeAt(2); 
    print(list);
    print(list.contains("集合"));
    print(list.indexOf('集合'));
  }
  void _mapType() {
    print('----mapType-----');

    Map names = { "a" : "小明", "b" : "小红" };
    print(names);
    Map ages = {};
    ages["a"] = 1;
    ages["b"]  = 2;

    ages.forEach((k, v) {
      print('k: $k v: $v');
    });
    Map ages2 = ages.map((k, v) {
      return MapEntry(v, k);
    });
    print(ages2);
    for(var key in ages.keys) {
      print('key: $key value: ${ages[key]}');
    }
    print(ages.containsKey("a"));
    print(ages.containsValue(1));
    ages.remove('a');
    print(ages);
    ages.clear();
    print(ages);
  }
  _tips() {
    print('----tips-----');

    dynamic x = 'hal';
    print(x.runtimeType);
    print(x);

    x = 123;
    print(x.runtimeType);
    print(x);

    var a = 'val';
    print(a.runtimeType);
    print(a);

    Object b = 'b';
    print(b.runtimeType);
    print(b);
  }
  @override
  Widget build(BuildContext context) {
    _numType();
    _stringType();
    _boolType();
    _listType();
    _mapType();
    _tips();
    return Container(
      child: Text("常用数据类型，请查看控制台输出"),
    );
  }
}