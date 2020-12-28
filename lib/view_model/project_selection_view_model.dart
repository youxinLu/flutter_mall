import 'package:mall/constant/app_parameters.dart';
import 'package:mall/model/goods_entity.dart';
import 'package:mall/model/project_selection_detail_entity.dart';
import 'package:mall/service/project_selection_service.dart';
import 'package:mall/utils/toast_util.dart';
import 'package:mall/view_model/base_view_model.dart';
import 'package:mall/view_model/page_state.dart';

class ProjectSelectionViewModel extends BaseViewModel {
  ProjectSelectionService _projectSelectionService = ProjectSelectionService();
  ProjectSelectionDetailTopic _projectSelectionDetailTopic;
  List<GoodsEntity> _goods = List();
  List<ProjectSelectionDetailTopic> _relatedProjectSelectionDetailTopics =
      List();

  ProjectSelectionDetailTopic get projectSelectionDetailTopic =>
      _projectSelectionDetailTopic;

  List<ProjectSelectionDetailTopic> get relatedProjectSelectionDetailTopics =>
      _relatedProjectSelectionDetailTopics;

  List<GoodsEntity> get goods => _goods;

  queryDetail(int id) {
    var parameters = {AppParameters.ID: id};
    _projectSelectionService
        .projectSelectionDetail(parameters)
        .then((response) {
      if (response.isSuccess) {
        _projectSelectionDetailTopic = response.data.topic;
        _goods = response.data.goods;
        pageState = PageState.hasData;
        queryRelatedGoods(parameters);
      } else {
        ToastUtil.showToast(response.message);
      }
    });
  }

  queryRelatedGoods(var parameters) {
    _projectSelectionService
        .projectSelectionRecommend(parameters)
        .then((response) {
      if (response.isSuccess) {
        _relatedProjectSelectionDetailTopics = response.data.xList;
        notifyListeners();
      } else {
        ToastUtil.showToast(response.message);
      }
    });
  }
}
