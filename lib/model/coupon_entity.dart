class CouponEntity {
	int total;
	int pages;
	int limit;
	int page;
	List<CouponList> xList;

	CouponEntity({this.total, this.pages, this.limit, this.page, this.xList});

	CouponEntity.fromJson(Map<String, dynamic> json) {
		total = json['total'];
		pages = json['pages'];
		limit = json['limit'];
		page = json['page'];
		if (json['list'] != null) {
			xList = new List<CouponList>();(json['list'] as List).forEach((v) { xList.add(new CouponList.fromJson(v)); });
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

class CouponList {
	String min;
	String name;
	String discount;
	String startTime;
	int id;
	String tag;
	String endTime;
	String desc;

	CouponList({this.min, this.name, this.discount, this.startTime, this.id, this.tag, this.endTime, this.desc});

	CouponList.fromJson(Map<String, dynamic> json) {
		min = json['min'];
		name = json['name'];
		discount = json['discount'];
		startTime = json['startTime'];
		id = json['id'];
		tag = json['tag'];
		endTime = json['endTime'];
		desc = json['desc'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['min'] = this.min;
		data['name'] = this.name;
		data['discount'] = this.discount;
		data['startTime'] = this.startTime;
		data['id'] = this.id;
		data['tag'] = this.tag;
		data['endTime'] = this.endTime;
		data['desc'] = this.desc;
		return data;
	}
}
