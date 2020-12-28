import 'package:mall/model/goods_entity.dart';

class FootPrintEntity {
  int total;
  int pages;
  int limit;
  int page;
  List<FootPrintGoodsEntity> xList;

  FootPrintEntity({this.total, this.pages, this.limit, this.page, this.xList});

  FootPrintEntity.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    pages = json['pages'];
    limit = json['limit'];
    page = json['page'];
    if (json['list'] != null) {
      xList = new List<FootPrintGoodsEntity>();
      (json['list'] as List).forEach((v) {
        xList.add(new FootPrintGoodsEntity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['pages'] = this.pages;
    data['limit'] = this.limit;
    data['page'] = this.page;
    if (this.xList != null) {
      data['list'] = this.xList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FootPrintGoodsEntity {
  String brief;
  String picUrl;
  String name;
  double counterPrice;
  int id;
  bool isNew;
  double retailPrice;
  bool isHot;
  bool isCheck = false;
  int goodsId;

  FootPrintGoodsEntity(
      {this.brief,
      this.picUrl,
      this.name,
      this.counterPrice,
      this.id,
      this.isNew,
      this.retailPrice,
      this.isHot,
      this.goodsId,
      this.isCheck});

  FootPrintGoodsEntity.fromJson(Map<String, dynamic> json) {
    brief = json['brief'];
    picUrl = json['picUrl'];
    name = json['name'];
    counterPrice = json['counterPrice'];
    id = json['id'];
    goodsId = json['goodsId'];
    isNew = json['isNew'];
    retailPrice = json['retailPrice'];
    isHot = json['isHot'];
    isCheck = false;
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
    data['goodsId'] = this.goodsId;
    data['isCheck'] = this.isCheck;
    return data;
  }
}
