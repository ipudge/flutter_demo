class CommonModel{
  String icon;
  String title;
  String url;
  String statusBarColor;
  bool hideAppBar;

  CommonModel({this.icon, this.title, this.url, this.statusBarColor, this.hideAppBar});

  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
      icon: json['icon'],
      title: json['title'],
      url: json['url'],
      statusBarColor: json['statusBarColor'],
      hideAppBar: json['hideAppBar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "icon": this.icon,
      "title": this.title,
      "url": this.url,
      "statusBarColor": this.statusBarColor,
      "hideAppBar": this.hideAppBar,
    };
  }
}