class  BrandDetailEntity {
	double floorPrice;
	String picUrl;
	bool deleted;
	String addTime;
	int sortOrder;
	String name;
	String updateTime;
	int id;
	String desc;

	BrandDetailEntity({this.floorPrice, this.picUrl, this.deleted, this.addTime, this.sortOrder, this.name, this.updateTime, this.id, this.desc});

	BrandDetailEntity.fromJson(Map<String, dynamic> json) {
		floorPrice = json['floorPrice'];
		picUrl = json['picUrl'];
		deleted = json['deleted'];
		addTime = json['addTime'];
		sortOrder = json['sortOrder'];
		name = json['name'];
		updateTime = json['updateTime'];
		id = json['id'];
		desc = json['desc'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['floorPrice'] = this.floorPrice;
		data['picUrl'] = this.picUrl;
		data['deleted'] = this.deleted;
		data['addTime'] = this.addTime;
		data['sortOrder'] = this.sortOrder;
		data['name'] = this.name;
		data['updateTime'] = this.updateTime;
		data['id'] = this.id;
		data['desc'] = this.desc;
		return data;
	}
}
