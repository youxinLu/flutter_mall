class CartEntity {
	CartTotalBean cartTotal;
	List<CartBean> cartList;

	CartEntity({this.cartTotal, this.cartList});

	CartEntity.fromJson(Map<String, dynamic> json) {
		cartTotal = json['cartTotal'] != null ? new CartTotalBean.fromJson(json['cartTotal']) : null;
		if (json['cartList'] != null) {
			cartList = new List<CartBean>();(json['cartList'] as List).forEach((v) { cartList.add(new CartBean.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.cartTotal != null) {
      data['cartTotal'] = this.cartTotal.toJson();
    }
		if (this.cartList != null) {
      data['cartList'] =  this.cartList.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class CartTotalBean {
	int goodsCount;
	int checkedGoodsCount;
	var goodsAmount;
	var checkedGoodsAmount;

	CartTotalBean({this.goodsCount, this.checkedGoodsCount, this.goodsAmount, this.checkedGoodsAmount});

	CartTotalBean.fromJson(Map<String, dynamic> json) {
		goodsCount = json['goodsCount'];
		checkedGoodsCount = json['checkedGoodsCount'];
		goodsAmount = json['goodsAmount'];
		checkedGoodsAmount = json['checkedGoodsAmount'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['goodsCount'] = this.goodsCount;
		data['checkedGoodsCount'] = this.checkedGoodsCount;
		data['goodsAmount'] = this.goodsAmount;
		data['checkedGoodsAmount'] = this.checkedGoodsAmount;
		return data;
	}
}

class CartBean {
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

	CartBean({this.productId, this.addTime, this.goodsId, this.goodsSn, this.updateTime, this.userId, this.specifications, this.number, this.picUrl, this.deleted, this.price, this.checked, this.id, this.goodsName});

	CartBean.fromJson(Map<String, dynamic> json) {
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
