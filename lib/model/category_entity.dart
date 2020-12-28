class CategoryList {
  List<CategoryEntity> categories;

  CategoryList(this.categories);

  factory CategoryList.fromJson(List<dynamic> parseJson) {
    List<CategoryEntity> categories;
    categories = parseJson.map((i) => CategoryEntity.fromJson(i)).toList();
    return CategoryList(categories);
  }
}

class CategoryEntity {
  String picUrl;
  bool deleted;
  String keywords;
  String addTime;
  String level;
  int sortOrder;
  String name;
  int pid;
  String updateTime;
  int id;
  String iconUrl;
  String desc;

  CategoryEntity({
    this.picUrl,
    this.deleted,
    this.keywords,
    this.addTime,
    this.level,
    this.sortOrder,
    this.name,
    this.pid,
    this.updateTime,
    this.id,
    this.iconUrl,
    this.desc,
  });

  CategoryEntity.fromJson(Map<String, dynamic> json) {
    picUrl = json['picUrl'];
    deleted = json['deleted'];
    keywords = json['keywords'];
    addTime = json['addTime'];
    level = json['level'];
    sortOrder = json['sortOrder'];
    name = json['name'];
    pid = json['pid'];
    updateTime = json['updateTime'];
    id = json['id'];
    iconUrl = json['iconUrl'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['picUrl'] = this.picUrl;
    data['deleted'] = this.deleted;
    data['keywords'] = this.keywords;
    data['addTime'] = this.addTime;
    data['level'] = this.level;
    data['sortOrder'] = this.sortOrder;
    data['name'] = this.name;
    data['pid'] = this.pid;
    data['updateTime'] = this.updateTime;
    data['id'] = this.id;
    data['iconUrl'] = this.iconUrl;
    data['desc'] = this.desc;
    return data;
  }
}
