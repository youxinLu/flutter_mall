import 'package:mall/model/goods_entity.dart';

class HomeEntity {
	List<GoodsEntity> newGoodsList;
	List<HomeModelCouponlist> couponList;
	List<HomeModelChannel> channel;
	List<HomeModelGrouponlist> grouponList;
	List<HomeModelBanner> banner;
	List<HomeModelBrandlist> brandList;
	List<GoodsEntity> hotGoodsList;
	List<HomeModelTopiclist> topicList;
	List<HomeModelFloorgoodslist> floorGoodsList;

	HomeEntity({this.newGoodsList, this.couponList, this.channel, this.grouponList, this.banner, this.brandList, this.hotGoodsList, this.topicList, this.floorGoodsList});

	HomeEntity.fromJson(Map<String, dynamic> json) {
		if (json['newGoodsList'] != null) {
			newGoodsList = new List<GoodsEntity>();(json['newGoodsList'] as List).forEach((v) { newGoodsList.add(new GoodsEntity.fromJson(v)); });
		}
		if (json['couponList'] != null) {
			couponList = new List<HomeModelCouponlist>();(json['couponList'] as List).forEach((v) { couponList.add(new HomeModelCouponlist.fromJson(v)); });
		}
		if (json['channel'] != null) {
			channel = new List<HomeModelChannel>();(json['channel'] as List).forEach((v) { channel.add(new HomeModelChannel.fromJson(v)); });
		}
		if (json['grouponList'] != null) {
			grouponList = new List<HomeModelGrouponlist>();(json['grouponList'] as List).forEach((v) { grouponList.add(new HomeModelGrouponlist.fromJson(v)); });
		}
		if (json['banner'] != null) {
			banner = new List<HomeModelBanner>();(json['banner'] as List).forEach((v) { banner.add(new HomeModelBanner.fromJson(v)); });
		}
		if (json['brandList'] != null) {
			brandList = new List<HomeModelBrandlist>();(json['brandList'] as List).forEach((v) { brandList.add(new HomeModelBrandlist.fromJson(v)); });
		}
		if (json['hotGoodsList'] != null) {
			hotGoodsList = new List<GoodsEntity>();(json['hotGoodsList'] as List).forEach((v) { hotGoodsList.add(new GoodsEntity.fromJson(v)); });
		}
		if (json['topicList'] != null) {
			topicList = new List<HomeModelTopiclist>();(json['topicList'] as List).forEach((v) { topicList.add(new HomeModelTopiclist.fromJson(v)); });
		}
		if (json['floorGoodsList'] != null) {
			floorGoodsList = new List<HomeModelFloorgoodslist>();(json['floorGoodsList'] as List).forEach((v) { floorGoodsList.add(new HomeModelFloorgoodslist.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.newGoodsList != null) {
      data['newGoodsList'] =  this.newGoodsList.map((v) => v.toJson()).toList();
    }
		if (this.couponList != null) {
      data['couponList'] =  this.couponList.map((v) => v.toJson()).toList();
    }
		if (this.channel != null) {
      data['channel'] =  this.channel.map((v) => v.toJson()).toList();
    }
		if (this.grouponList != null) {
      data['grouponList'] =  this.grouponList.map((v) => v.toJson()).toList();
    }
		if (this.banner != null) {
      data['banner'] =  this.banner.map((v) => v.toJson()).toList();
    }
		if (this.brandList != null) {
      data['brandList'] =  this.brandList.map((v) => v.toJson()).toList();
    }
		if (this.hotGoodsList != null) {
      data['hotGoodsList'] =  this.hotGoodsList.map((v) => v.toJson()).toList();
    }
		if (this.topicList != null) {
      data['topicList'] =  this.topicList.map((v) => v.toJson()).toList();
    }
		if (this.floorGoodsList != null) {
      data['floorGoodsList'] =  this.floorGoodsList.map((v) => v.toJson()).toList();
    }
		return data;
	}
}


class HomeModelCouponlist {
	double min;
	String name;
	double discount;
	int days;
	int id;
	String tag;
	String desc;

	HomeModelCouponlist({this.min, this.name, this.discount, this.days, this.id, this.tag, this.desc});

	HomeModelCouponlist.fromJson(Map<String, dynamic> json) {
		min = json['min'];
		name = json['name'];
		discount = json['discount'];
		days = json['days'];
		id = json['id'];
		tag = json['tag'];
		desc = json['desc'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['min'] = this.min;
		data['name'] = this.name;
		data['discount'] = this.discount;
		data['days'] = this.days;
		data['id'] = this.id;
		data['tag'] = this.tag;
		data['desc'] = this.desc;
		return data;
	}
}

class HomeModelChannel {
	String name;
	int id;
	String iconUrl;

	HomeModelChannel({this.name, this.id, this.iconUrl});

	HomeModelChannel.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		id = json['id'];
		iconUrl = json['iconUrl'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['id'] = this.id;
		data['iconUrl'] = this.iconUrl;
		return data;
	}
}

class HomeModelGrouponlist {
	String brief;
	String picUrl;
	double grouponPrice;
	int grouponDiscount;
	String name;
	double counterPrice;
	int id;
	double retailPrice;
	int grouponMember;

	HomeModelGrouponlist({this.brief, this.picUrl, this.grouponPrice, this.grouponDiscount, this.name, this.counterPrice, this.id, this.retailPrice, this.grouponMember});

	HomeModelGrouponlist.fromJson(Map<String, dynamic> json) {
		brief = json['brief'];
		picUrl = json['picUrl'];
		grouponPrice = json['grouponPrice'];
		grouponDiscount = json['grouponDiscount'];
		name = json['name'];
		counterPrice = json['counterPrice'];
		id = json['id'];
		retailPrice = json['retailPrice'];
		grouponMember = json['grouponMember'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['brief'] = this.brief;
		data['picUrl'] = this.picUrl;
		data['grouponPrice'] = this.grouponPrice;
		data['grouponDiscount'] = this.grouponDiscount;
		data['name'] = this.name;
		data['counterPrice'] = this.counterPrice;
		data['id'] = this.id;
		data['retailPrice'] = this.retailPrice;
		data['grouponMember'] = this.grouponMember;
		return data;
	}
}

class HomeModelBanner {
	bool deleted;
	String addTime;
	String name;
	String link;
	String updateTime;
	int id;
	int position;
	String url;
	String content;
	bool enabled;

	HomeModelBanner({this.deleted, this.addTime, this.name, this.link, this.updateTime, this.id, this.position, this.url, this.content, this.enabled});

	HomeModelBanner.fromJson(Map<String, dynamic> json) {
		deleted = json['deleted'];
		addTime = json['addTime'];
		name = json['name'];
		link = json['link'];
		updateTime = json['updateTime'];
		id = json['id'];
		position = json['position'];
		url = json['url'];
		content = json['content'];
		enabled = json['enabled'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['deleted'] = this.deleted;
		data['addTime'] = this.addTime;
		data['name'] = this.name;
		data['link'] = this.link;
		data['updateTime'] = this.updateTime;
		data['id'] = this.id;
		data['position'] = this.position;
		data['url'] = this.url;
		data['content'] = this.content;
		data['enabled'] = this.enabled;
		return data;
	}
}

class HomeModelBrandlist {
	double floorPrice;
	String picUrl;
	String name;
	int id;
	String desc;

	HomeModelBrandlist({this.floorPrice, this.picUrl, this.name, this.id, this.desc});

	HomeModelBrandlist.fromJson(Map<String, dynamic> json) {
		floorPrice = json['floorPrice'];
		picUrl = json['picUrl'];
		name = json['name'];
		id = json['id'];
		desc = json['desc'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['floorPrice'] = this.floorPrice;
		data['picUrl'] = this.picUrl;
		data['name'] = this.name;
		data['id'] = this.id;
		data['desc'] = this.desc;
		return data;
	}
}

class HomeModelTopiclist {
	String picUrl;
	double price;
	String subtitle;
	int id;
	String title;
	String readCount;

	HomeModelTopiclist({this.picUrl, this.price, this.subtitle, this.id, this.title, this.readCount});

	HomeModelTopiclist.fromJson(Map<String, dynamic> json) {
		picUrl = json['picUrl'];
		price = json['price'];
		subtitle = json['subtitle'];
		id = json['id'];
		title = json['title'];
		readCount = json['readCount'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['picUrl'] = this.picUrl;
		data['price'] = this.price;
		data['subtitle'] = this.subtitle;
		data['id'] = this.id;
		data['title'] = this.title;
		data['readCount'] = this.readCount;
		return data;
	}
}

class HomeModelFloorgoodslist {
	String name;
	List<GoodsEntity> goodsList;
	int id;

	HomeModelFloorgoodslist({this.name, this.goodsList, this.id});

	HomeModelFloorgoodslist.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		if (json['goodsList'] != null) {
			goodsList = new List<GoodsEntity>();(json['goodsList'] as List).forEach((v) { goodsList.add(new GoodsEntity.fromJson(v)); });
		}
		id = json['id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		if (this.goodsList != null) {
      data['goodsList'] =  this.goodsList.map((v) => v.toJson()).toList();
    }
		data['id'] = this.id;
		return data;
	}
}

