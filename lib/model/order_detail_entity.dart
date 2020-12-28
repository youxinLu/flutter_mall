class OrderDetailEntity {
	OrderInfo orderInfo;
	List<OrderGood> orderGoods;

	OrderDetailEntity({this.orderInfo, this.orderGoods});

	OrderDetailEntity.fromJson(Map<String, dynamic> json) {
		orderInfo = json['orderInfo'] != null ? new OrderInfo.fromJson(json['orderInfo']) : null;
		if (json['orderGoods'] != null) {
			orderGoods = new List<OrderGood>();(json['orderGoods'] as List).forEach((v) { orderGoods.add(new OrderGood.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.orderInfo != null) {
      data['orderInfo'] = this.orderInfo.toJson();
    }
		if (this.orderGoods != null) {
      data['orderGoods'] =  this.orderGoods.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class OrderInfo {
	String orderStatusText;
	String consignee;
	String address;
	String addTime;
	String orderSn;
	double actualPrice;
	double goodsPrice;
	String mobile;
	double couponPrice;
	int id;
	double freightPrice;
	OrderInfoHandleOption handleOption;

	OrderInfo({this.orderStatusText, this.consignee, this.address, this.addTime, this.orderSn, this.actualPrice, this.goodsPrice, this.mobile, this.couponPrice, this.id, this.freightPrice, this.handleOption});

	OrderInfo.fromJson(Map<String, dynamic> json) {
		orderStatusText = json['orderStatusText'];
		consignee = json['consignee'];
		address = json['address'];
		addTime = json['addTime'];
		orderSn = json['orderSn'];
		actualPrice = json['actualPrice'];
		goodsPrice = json['goodsPrice'];
		mobile = json['mobile'];
		couponPrice = json['couponPrice'];
		id = json['id'];
		freightPrice = json['freightPrice'];
		handleOption = json['handleOption'] != null ? new OrderInfoHandleOption.fromJson(json['handleOption']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['orderStatusText'] = this.orderStatusText;
		data['consignee'] = this.consignee;
		data['address'] = this.address;
		data['addTime'] = this.addTime;
		data['orderSn'] = this.orderSn;
		data['actualPrice'] = this.actualPrice;
		data['goodsPrice'] = this.goodsPrice;
		data['mobile'] = this.mobile;
		data['couponPrice'] = this.couponPrice;
		data['id'] = this.id;
		data['freightPrice'] = this.freightPrice;
		if (this.handleOption != null) {
      data['handleOption'] = this.handleOption.toJson();
    }
		return data;
	}
}

class OrderInfoHandleOption {
	bool cancel;
	bool confirm;
	bool rebuy;
	bool pay;
	bool comment;
	bool delete;
	bool refund;

	OrderInfoHandleOption({this.cancel, this.confirm, this.rebuy, this.pay, this.comment, this.delete, this.refund});

	OrderInfoHandleOption.fromJson(Map<String, dynamic> json) {
		cancel = json['cancel'];
		confirm = json['confirm'];
		rebuy = json['rebuy'];
		pay = json['pay'];
		comment = json['comment'];
		delete = json['delete'];
		refund = json['refund'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['cancel'] = this.cancel;
		data['confirm'] = this.confirm;
		data['rebuy'] = this.rebuy;
		data['pay'] = this.pay;
		data['comment'] = this.comment;
		data['delete'] = this.delete;
		data['refund'] = this.refund;
		return data;
	}
}

class OrderGood {
	int productId;
	String addTime;
	int orderId;
	int goodsId;
	String goodsSn;
	String updateTime;
	List<String> specifications;
	int number;
	String picUrl;
	bool deleted;
	double price;
	int comment;
	int id;
	String goodsName;

	OrderGood({this.productId, this.addTime, this.orderId, this.goodsId, this.goodsSn, this.updateTime, this.specifications, this.number, this.picUrl, this.deleted, this.price, this.comment, this.id, this.goodsName});

	OrderGood.fromJson(Map<String, dynamic> json) {
		productId = json['productId'];
		addTime = json['addTime'];
		orderId = json['orderId'];
		goodsId = json['goodsId'];
		goodsSn = json['goodsSn'];
		updateTime = json['updateTime'];
		specifications = json['specifications']?.cast<String>();
		number = json['number'];
		picUrl = json['picUrl'];
		deleted = json['deleted'];
		price = json['price'];
		comment = json['comment'];
		id = json['id'];
		goodsName = json['goodsName'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['productId'] = this.productId;
		data['addTime'] = this.addTime;
		data['orderId'] = this.orderId;
		data['goodsId'] = this.goodsId;
		data['goodsSn'] = this.goodsSn;
		data['updateTime'] = this.updateTime;
		data['specifications'] = this.specifications;
		data['number'] = this.number;
		data['picUrl'] = this.picUrl;
		data['deleted'] = this.deleted;
		data['price'] = this.price;
		data['comment'] = this.comment;
		data['id'] = this.id;
		data['goodsName'] = this.goodsName;
		return data;
	}
}
