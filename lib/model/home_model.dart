import 'common_model.dart';
import 'config_model.dart';
import 'grid_nav_model.dart';
import 'sales_box_model.dart';

class HomeModel{
  final ConfigModel config;
  final List<CommonModel> bannerList;
  final List<CommonModel> localNavList;
  final List<CommonModel> subNavList;
  final SalesBoxModel salesBox;
  final GridNavModel gridNav;

  HomeModel({this.config, this.bannerList, this.localNavList, this.subNavList, this.salesBox, this.gridNav});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    List bannerList = json['bannerList'] as List;
    List localNavList = json['localNavList'] as List;
    List subNavList = json['subNavList'] as List;

    return HomeModel(
      bannerList: bannerList.map((item) => CommonModel.fromJson(item)).toList(),
      localNavList: localNavList.map((item) => CommonModel.fromJson(item)).toList(),
      subNavList: subNavList.map((item) => CommonModel.fromJson(item)).toList(),
      config: ConfigModel.fromJson(json['config']),
      salesBox: SalesBoxModel.fromJson(json['salesBox']),
      gridNav: GridNavModel.fromJson(json['gridNav'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "bannerList": this.bannerList.map((item) => item.toJson()).toList(),
      "localNavList": this.localNavList.map((item) => item.toJson()).toList(),
      "subNavList": this.subNavList.map((item) => item.toJson()).toList(),
      "config": this.config.toJson(),
      "salesBox": this.salesBox.toJson(),
      "gridNav": this.gridNav.toJson()
    };
  }
}