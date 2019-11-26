class SearchModel {
  List<SearchItem> data;
  String keyword;

  SearchModel({this.data, this.keyword});

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    var dataJson = json['data'] as List;
    return SearchModel(
      data: dataJson.map((item) => SearchItem.fromJson(item)).toList(),
      keyword: json['keyword']
    );
  }
}

class SearchItem {
  String word;
  String type;
  String price;
  String star;
  String zonename;
  String districtname;
  String url;

  SearchItem(
      {this.word,
      this.type,
      this.price,
      this.star,
      this.zonename,
      this.districtname,
      this.url});

  factory SearchItem.fromJson(Map<String, dynamic> json) {
    return SearchItem(
        word: json['word'],
        type: json['type'],
        price: json['price'],
        star: json['star'],
        zonename: json['zonename'],
        districtname: json['districtname'],
        url: json['url']);
  }

  Map<String, dynamic> toJson() {
    return {
      "word": this.word,
      "type": this.type,
      "price": this.price,
      "star": this.star,
      "zonename": this.zonename,
      "districtname": this.districtname,
      "url": this.url,
    };
  }
}
