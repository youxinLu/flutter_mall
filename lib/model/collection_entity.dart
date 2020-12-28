class CollectionEntity {
	int total;
	int pages;
	int limit;
	int page;
	List<CollectionList> xList;

	CollectionEntity({this.total, this.pages, this.limit, this.page, this.xList});

	CollectionEntity.fromJson(Map<String, dynamic> json) {
		total = json['total'];
		pages = json['pages'];
		limit = json['limit'];
		page = json['page'];
		if (json['list'] != null) {
			xList = new List<CollectionList>();(json['list'] as List).forEach((v) { xList.add(new CollectionList.fromJson(v)); });
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
		return data;
	}
}

class CollectionList {
	String brief;
	String picUrl;
	int valueId;
	String name;
	int id;
	int type;
	double retailPrice;

	CollectionList({this.brief, this.picUrl, this.valueId, this.name, this.id, this.type, this.retailPrice});

	CollectionList.fromJson(Map<String, dynamic> json) {
		brief = json['brief'];
		picUrl = json['picUrl'];
		valueId = json['valueId'];
		name = json['name'];
		id = json['id'];
		type = json['type'];
		retailPrice = json['retailPrice'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['brief'] = this.brief;
		data['picUrl'] = this.picUrl;
		data['valueId'] = this.valueId;
		data['name'] = this.name;
		data['id'] = this.id;
		data['type'] = this.type;
		data['retailPrice'] = this.retailPrice;
		return data;
	}
}
