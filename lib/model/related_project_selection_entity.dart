import 'package:mall/model/project_selection_detail_entity.dart';

class RelatedProjectSelectionEntity {
  int total;
  int pages;
  int limit;
  int page;
  List<ProjectSelectionDetailTopic> xList;

  RelatedProjectSelectionEntity(
      {this.total, this.pages, this.limit, this.page, this.xList});

  RelatedProjectSelectionEntity.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    pages = json['pages'];
    limit = json['limit'];
    page = json['page'];
    if (json['list'] != null) {
      xList = new List<ProjectSelectionDetailTopic>();
      (json['list'] as List).forEach((v) {
        xList.add(new ProjectSelectionDetailTopic.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['pages'] = this.pages;
    data['limit'] = this.limit;
    data['page'] = this.page;
    if (this.xList != null) {
      data['list'] = this.xList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
