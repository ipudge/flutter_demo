import 'common_model.dart';

class SalesBoxModel{
  String icon;
  String moreUrl;
  CommonModel bigCard1;
  CommonModel bigCard2;
  CommonModel smallCard1;
  CommonModel smallCard2;
  CommonModel smallCard3;
  CommonModel smallCard4;

  SalesBoxModel({this.icon, this.moreUrl, this.bigCard1, this.bigCard2, this.smallCard1, this.smallCard2, this.smallCard3, this.smallCard4});

  factory SalesBoxModel.fromJson(Map<String, dynamic> json) {
    return SalesBoxModel(
      icon: json['icon'],
      moreUrl: json['moreUrl'],
      bigCard1: CommonModel.fromJson(json['bigCard1']),
      bigCard2: CommonModel.fromJson(json['bigCard2']),
      smallCard1: CommonModel.fromJson(json['smallCard1']),
      smallCard2: CommonModel.fromJson(json['smallCard2']),
      smallCard3: CommonModel.fromJson(json['smallCard3']),
      smallCard4: CommonModel.fromJson(json['smallCard4']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "icon": this.icon,
      "moreUrl": this.moreUrl,
      "bigCard1": this.bigCard1.toJson(),
      "bigCard2": this.bigCard2.toJson(),
      "smallCard1": this.smallCard1.toJson(),
      "smallCard2": this.smallCard2.toJson(),
      "smallCard3": this.smallCard3.toJson(),
      "smallCard4": this.smallCard4.toJson(),
    };
  }
}