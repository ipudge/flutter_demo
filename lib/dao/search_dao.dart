import 'dart:async';
import 'dart:convert';
import 'package:haha/model/search_model.dart';
import 'package:http/http.dart' as http;

class SearchDao{
  static Future<SearchModel> fetchData(String url, String keyword) async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder();
      final result = json.decode(utf8decoder.convert(response.bodyBytes));
      SearchModel searchModel = SearchModel.fromJson(result);
      searchModel.keyword = keyword;
      return searchModel;
    } else {
      throw Exception('fail haha');
    }
  }
}