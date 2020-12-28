import 'package:mall/model/category_entity.dart';
import 'package:mall/model/goods_entity.dart';

class CategoryGoodsEntity {
	int total;
	int pages;
	int limit;
	int page;
	List<GoodsEntity> xList;
	List<CategoryEntity> filterCategoryList;

	CategoryGoodsEntity({this.total, this.pages, this.limit, this.page, this.xList, this.filterCategoryList});

	CategoryGoodsEntity.fromJson(Map<String, dynamic> json) {
		total = json['total'];
		pages = json['pages'];
		limit = json['limit'];
		page = json['page'];
		if (json['list'] != null) {
			xList = new List<GoodsEntity>();(json['list'] as List).forEach((v) { xList.add(new GoodsEntity.fromJson(v)); });
		}
		if (json['filterCategoryList'] != null) {
			filterCategoryList = new List<CategoryEntity>();(json['filterCategoryList'] as List).forEach((v) { filterCategoryList.add(new CategoryEntity.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['total'] = this.total;
		data['pages'] = this.pages;
		data['limit'] = this.limit;
		data['page'] = this.page;
		if (this.xList != null) {
      data['list'] =  this.xList.map((v) => v.toJson()).toList();
    }
		if (this.filterCategoryList != null) {
      data['filterCategoryList'] =  this.filterCategoryList.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

