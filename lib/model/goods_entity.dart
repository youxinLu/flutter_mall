class GoodsEntity {
  String brief;
  String picUrl;
  String name;
  double counterPrice;
  int id;
  bool isNew;
  double retailPrice;
  bool isHot;

  GoodsEntity(
      {this.brief,
      this.picUrl,
      this.name,
      this.counterPrice,
      this.id,
      this.isNew,
      this.retailPrice,
      this.isHot});

  GoodsEntity.fromJson(Map<String, dynamic> json) {
    brief = json['brief'];
    picUrl = json['picUrl'];
    name = json['name'];
    counterPrice = json['counterPrice'];
    id = json['id'];
    isNew = json['isNew'];
    retailPrice = json['retailPrice'];
    isHot = json['isHot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brief'] = this.brief;
    data['picUrl'] = this.picUrl;
    data['name'] = this.name;
    data['counterPrice'] = this.counterPrice;
    data['id'] = this.id;
    data['isNew'] = this.isNew;
    data['retailPrice'] = this.retailPrice;
    data['isHot'] = this.isHot;
    return data;
  }
}
