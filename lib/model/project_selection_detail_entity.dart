import 'package:mall/model/goods_entity.dart';

class ProjectSelectionDetailEntity {
	ProjectSelectionDetailTopic topic;
	List<GoodsEntity> goods;

	ProjectSelectionDetailEntity({this.topic, this.goods});

	ProjectSelectionDetailEntity.fromJson(Map<String, dynamic> json) {
		topic = json['topic'] != null ? new ProjectSelectionDetailTopic.fromJson(json['topic']) : null;
		if (json['goods'] != null) {
			goods = new List<GoodsEntity>();(json['goods'] as List).forEach((v) { goods.add(new GoodsEntity.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.topic != null) {
      data['topic'] = this.topic.toJson();
    }
		if (this.goods != null) {
      data['goods'] =  this.goods.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class ProjectSelectionDetailTopic {
	String picUrl;
	bool deleted;
	String addTime;
	double price;
	String subtitle;
	int sortOrder;
	List<int> goods;
	String updateTime;
	int id;
	String title;
	String readCount;
	String content;

	ProjectSelectionDetailTopic({this.picUrl, this.deleted, this.addTime, this.price, this.subtitle, this.sortOrder, this.goods, this.updateTime, this.id, this.title, this.readCount, this.content});

	ProjectSelectionDetailTopic.fromJson(Map<String, dynamic> json) {
		picUrl = json['picUrl'];
		deleted = json['deleted'];
		addTime = json['addTime'];
		price = json['price'];
		subtitle = json['subtitle'];
		sortOrder = json['sortOrder'];
		goods = json['goods']?.cast<int>();
		updateTime = json['updateTime'];
		id = json['id'];
		title = json['title'];
		readCount = json['readCount'];
		content = json['content'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['picUrl'] = this.picUrl;
		data['deleted'] = this.deleted;
		data['addTime'] = this.addTime;
		data['price'] = this.price;
		data['subtitle'] = this.subtitle;
		data['sortOrder'] = this.sortOrder;
		data['goods'] = this.goods;
		data['updateTime'] = this.updateTime;
		data['id'] = this.id;
		data['title'] = this.title;
		data['readCount'] = this.readCount;
		data['content'] = this.content;
		return data;
	}
}

