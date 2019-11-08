import 'common_model.dart';

class GridNavModel{
  final NavModel hotel;
  final NavModel flight;
  final NavModel travel;

  GridNavModel({this.hotel, this.flight, this.travel});

  factory GridNavModel.fromJson(Map<String, dynamic> json) {
    return GridNavModel(
      hotel: NavModel.fromJson(json['hotel']),
      flight: NavModel.fromJson(json['flight']),
      travel: NavModel.fromJson(json['travel'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "hotel": this.hotel.toJson(),
      "flight": this.flight.toJson(),
      "travel": this.travel.toJson()
    };
  }
}

class NavModel {
  String startColor;
  String endColor;
  CommonModel mainItem;
  CommonModel item1;
  CommonModel item2;
  CommonModel item3;
  CommonModel item4;

  NavModel({this.startColor, this.endColor, this.mainItem, this.item1, this.item2, this.item3, this.item4});

  factory NavModel.fromJson(Map<String, dynamic> json) {
    return NavModel(
      startColor: json['startColor'],
      endColor: json['endColor'],
      mainItem: CommonModel.fromJson(json['mainItem']),
      item1: CommonModel.fromJson(json['item1']),
      item2: CommonModel.fromJson(json['item2']),
      item3: CommonModel.fromJson(json['item3']),
      item4: CommonModel.fromJson(json['item4']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "startColor": this.startColor,
      "endColor": this.endColor,
      "mainItem": this.mainItem.toJson(),
      "item1": this.item1.toJson(),
      "item2": this.item2.toJson(),
      "item3": this.item3.toJson(),
      "item4": this.item4.toJson(),
    };
  }
}