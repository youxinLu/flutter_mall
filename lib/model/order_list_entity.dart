class OrderListEntity {
	int total;
	int pages;
	int limit;
	int page;
	List<OrderEntity> xList;

	OrderListEntity({this.total, this.pages, this.limit, this.page, this.xList});

	OrderListEntity.fromJson(Map<String, dynamic> json) {
		total = json['total'];
		pages = json['pages'];
		limit = json['limit'];
		page = json['page'];
		if (json['list'] != null) {
			xList = new List<OrderEntity>();(json['list'] as List).forEach((v) { xList.add(new OrderEntity.fromJson(v)); });
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

class OrderEntity {
	String orderStatusText;
	bool isGroupin;
	String orderSn;
	double actualPrice;
	List<OrderGoodsEntity> goodsList;
	int id;
	OrderListHandleoption handleOption;

	OrderEntity({this.orderStatusText, this.isGroupin, this.orderSn, this.actualPrice, this.goodsList, this.id, this.handleOption});

	OrderEntity.fromJson(Map<String, dynamic> json) {
		orderStatusText = json['orderStatusText'];
		isGroupin = json['isGroupin'];
		orderSn = json['orderSn'];
		actualPrice = json['actualPrice'];
		if (json['goodsList'] != null) {
			goodsList = new List<OrderGoodsEntity>();(json['goodsList'] as List).forEach((v) { goodsList.add(new OrderGoodsEntity.fromJson(v)); });
		}
		id = json['id'];
		handleOption = json['handleOption'] != null ? new OrderListHandleoption.fromJson(json['handleOption']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['orderStatusText'] = this.orderStatusText;
		data['isGroupin'] = this.isGroupin;
		data['orderSn'] = this.orderSn;
		data['actualPrice'] = this.actualPrice;
		if (this.goodsList != null) {
      data['goodsList'] =  this.goodsList.map((v) => v.toJson()).toList();
    }
		data['id'] = this.id;
		if (this.handleOption != null) {
      data['handleOption'] = this.handleOption.toJson();
    }
		return data;
	}
}

class OrderGoodsEntity {
	int number;
	String picUrl;
	double price;
	int id;
	String goodsName;
	List<String> specifications;

	OrderGoodsEntity({this.number, this.picUrl, this.price, this.id, this.goodsName, this.specifications});

	OrderGoodsEntity.fromJson(Map<String, dynamic> json) {
		number = json['number'];
		picUrl = json['picUrl'];
		price = json['price'];
		id = json['id'];
		goodsName = json['goodsName'];
		specifications = json['specifications']?.cast<String>();
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['number'] = this.number;
		data['picUrl'] = this.picUrl;
		data['price'] = this.price;
		data['id'] = this.id;
		data['goodsName'] = this.goodsName;
		data['specifications'] = this.specifications;
		return data;
	}
}

class OrderListHandleoption {
	bool cancel;
	bool confirm;
	bool rebuy;
	bool pay;
	bool comment;
	bool delete;
	bool refund;

	OrderListHandleoption({this.cancel, this.confirm, this.rebuy, this.pay, this.comment, this.delete, this.refund});

	OrderListHandleoption.fromJson(Map<String, dynamic> json) {
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
