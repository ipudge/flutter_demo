import 'dart:async';
import 'dart:convert';
import 'package:haha/model/home_model.dart';
import 'package:http/http.dart' as http;
const HOME_URL = 'https://devio.org/io/flutter_app/json/home_page.json';

class HomeDao{
  Future<HomeModel> fetchData() async {
    final response = await http.get(HOME_URL);
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder();
      final result = json.decode(utf8decoder.convert(response.bodyBytes));
      print(result);
      return HomeModel.fromJson(result);
    } else {
      throw Exception('fail haha');
    }
  }
}