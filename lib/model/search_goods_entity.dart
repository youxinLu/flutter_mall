import 'package:mall/model/goods_entity.dart';

class SearchGoodsEntity {
	int total;
	int pages;
	int limit;
	int page;
	List<GoodsEntity> xList;
	List<SearchGoodsFiltercategorylist> filterCategoryList;

	SearchGoodsEntity({this.total, this.pages, this.limit, this.page, this.xList, this.filterCategoryList});

	SearchGoodsEntity.fromJson(Map<String, dynamic> json) {
		total = json['total'];
		pages = json['pages'];
		limit = json['limit'];
		page = json['page'];
		if (json['list'] != null) {
			xList = new List<GoodsEntity>();(json['list'] as List).forEach((v) { xList.add(new GoodsEntity.fromJson(v)); });
		}
		if (json['filterCategoryList'] != null) {
			filterCategoryList = new List<SearchGoodsFiltercategorylist>();(json['filterCategoryList'] as List).forEach((v) { filterCategoryList.add(new SearchGoodsFiltercategorylist.fromJson(v)); });
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

class SearchGoodsFiltercategorylist {
	String picUrl;
	bool deleted;
	String keywords;
	String addTime;
	String level;
	int sortOrder;
	String name;
	int pid;
	String updateTime;
	int id;
	String iconUrl;
	String desc;

	SearchGoodsFiltercategorylist({this.picUrl, this.deleted, this.keywords, this.addTime, this.level, this.sortOrder, this.name, this.pid, this.updateTime, this.id, this.iconUrl, this.desc});

	SearchGoodsFiltercategorylist.fromJson(Map<String, dynamic> json) {
		picUrl = json['picUrl'];
		deleted = json['deleted'];
		keywords = json['keywords'];
		addTime = json['addTime'];
		level = json['level'];
		sortOrder = json['sortOrder'];
		name = json['name'];
		pid = json['pid'];
		updateTime = json['updateTime'];
		id = json['id'];
		iconUrl = json['iconUrl'];
		desc = json['desc'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['picUrl'] = this.picUrl;
		data['deleted'] = this.deleted;
		data['keywords'] = this.keywords;
		data['addTime'] = this.addTime;
		data['level'] = this.level;
		data['sortOrder'] = this.sortOrder;
		data['name'] = this.name;
		data['pid'] = this.pid;
		data['updateTime'] = this.updateTime;
		data['id'] = this.id;
		data['iconUrl'] = this.iconUrl;
		data['desc'] = this.desc;
		return data;
	}
}
