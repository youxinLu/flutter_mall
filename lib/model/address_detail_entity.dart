class AddressDetailEntity {
	String addTime;
	String city;
	String county;
	String updateTime;
	int userId;
	String areaCode;
	bool isDefault;
	String addressDetail;
	bool deleted;
	String province;
	String name;
	String tel;
	int id;

	AddressDetailEntity({this.addTime, this.city, this.county, this.updateTime, this.userId, this.areaCode, this.isDefault, this.addressDetail, this.deleted, this.province, this.name, this.tel, this.id});

	AddressDetailEntity.fromJson(Map<String, dynamic> json) {
		addTime = json['addTime'];
		city = json['city'];
		county = json['county'];
		updateTime = json['updateTime'];
		userId = json['userId'];
		areaCode = json['areaCode'];
		isDefault = json['isDefault'];
		addressDetail = json['addressDetail'];
		deleted = json['deleted'];
		province = json['province'];
		name = json['name'];
		tel = json['tel'];
		id = json['id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['addTime'] = this.addTime;
		data['city'] = this.city;
		data['county'] = this.county;
		data['updateTime'] = this.updateTime;
		data['userId'] = this.userId;
		data['areaCode'] = this.areaCode;
		data['isDefault'] = this.isDefault;
		data['addressDetail'] = this.addressDetail;
		data['deleted'] = this.deleted;
		data['province'] = this.province;
		data['name'] = this.name;
		data['tel'] = this.tel;
		data['id'] = this.id;
		return data;
	}
}
