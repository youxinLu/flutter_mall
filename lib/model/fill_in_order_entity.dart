class FillInOrderEntity {
	int grouponRulesId;
	double actualPrice;
	double orderTotalPrice;
	int cartId;
	int couponId;
	double goodsTotalPrice;
	int addressId;
	int grouponPrice;
	FillInOrderCheckedaddress checkedAddress;
	var couponPrice;
	int availableCouponLength;
	int freightPrice;
	List<FillInOrderCheckedgoodslist> checkedGoodsList;

	FillInOrderEntity({this.grouponRulesId, this.actualPrice, this.orderTotalPrice, this.cartId, this.couponId, this.goodsTotalPrice, this.addressId, this.grouponPrice, this.checkedAddress, this.couponPrice, this.availableCouponLength, this.freightPrice, this.checkedGoodsList});

	FillInOrderEntity.fromJson(Map<String, dynamic> json) {
		grouponRulesId = json['grouponRulesId'];
		actualPrice = json['actualPrice'];
		orderTotalPrice = json['orderTotalPrice'];
		cartId = json['cartId'];
		couponId = json['couponId'];
		goodsTotalPrice = json['goodsTotalPrice'];
		addressId = json['addressId'];
		grouponPrice = json['grouponPrice'];
		checkedAddress = json['checkedAddress'] != null ? new FillInOrderCheckedaddress.fromJson(json['checkedAddress']) : null;
		couponPrice = json['couponPrice'];
		availableCouponLength = json['availableCouponLength'];
		freightPrice = json['freightPrice'];
		if (json['checkedGoodsList'] != null) {
			checkedGoodsList = new List<FillInOrderCheckedgoodslist>();(json['checkedGoodsList'] as List).forEach((v) { checkedGoodsList.add(new FillInOrderCheckedgoodslist.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['grouponRulesId'] = this.grouponRulesId;
		data['actualPrice'] = this.actualPrice;
		data['orderTotalPrice'] = this.orderTotalPrice;
		data['cartId'] = this.cartId;
		data['couponId'] = this.couponId;
		data['goodsTotalPrice'] = this.goodsTotalPrice;
		data['addressId'] = this.addressId;
		data['grouponPrice'] = this.grouponPrice;
		if (this.checkedAddress != null) {
      data['checkedAddress'] = this.checkedAddress.toJson();
    }
		data['couponPrice'] = this.couponPrice;
		data['availableCouponLength'] = this.availableCouponLength;
		data['freightPrice'] = this.freightPrice;
		if (this.checkedGoodsList != null) {
      data['checkedGoodsList'] =  this.checkedGoodsList.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class FillInOrderCheckedaddress {
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

	FillInOrderCheckedaddress({this.addTime, this.city, this.county, this.updateTime, this.userId, this.areaCode, this.isDefault, this.addressDetail, this.deleted, this.province, this.name, this.tel, this.id});

	FillInOrderCheckedaddress.fromJson(Map<String, dynamic> json) {
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

class FillInOrderCheckedgoodslist {
	int productId;
	String addTime;
	int goodsId;
	String goodsSn;
	String updateTime;
	int userId;
	List<String> specifications;
	int number;
	String picUrl;
	bool deleted;
	double price;
	bool checked;
	int id;
	String goodsName;

	FillInOrderCheckedgoodslist({this.productId, this.addTime, this.goodsId, this.goodsSn, this.updateTime, this.userId, this.specifications, this.number, this.picUrl, this.deleted, this.price, this.checked, this.id, this.goodsName});

	FillInOrderCheckedgoodslist.fromJson(Map<String, dynamic> json) {
		productId = json['productId'];
		addTime = json['addTime'];
		goodsId = json['goodsId'];
		goodsSn = json['goodsSn'];
		updateTime = json['updateTime'];
		userId = json['userId'];
		specifications = json['specifications']?.cast<String>();
		number = json['number'];
		picUrl = json['picUrl'];
		deleted = json['deleted'];
		price = json['price'];
		checked = json['checked'];
		id = json['id'];
		goodsName = json['goodsName'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['productId'] = this.productId;
		data['addTime'] = this.addTime;
		data['goodsId'] = this.goodsId;
		data['goodsSn'] = this.goodsSn;
		data['updateTime'] = this.updateTime;
		data['userId'] = this.userId;
		data['specifications'] = this.specifications;
		data['number'] = this.number;
		data['picUrl'] = this.picUrl;
		data['deleted'] = this.deleted;
		data['price'] = this.price;
		data['checked'] = this.checked;
		data['id'] = this.id;
		data['goodsName'] = this.goodsName;
		return data;
	}
}
