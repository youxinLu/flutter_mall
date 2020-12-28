import 'package:pull_to_refresh/pull_to_refresh.dart';

/**
 * Create by luyouxin
 * description
    Created by $USER_NAME on 2020/11/2.
 */

class RefreshStateUtil {
  RefreshStateUtil._();

  static final _instance = RefreshStateUtil._();

  factory RefreshStateUtil.getInstance() => _instance;

  stopRefreshOrLoadMore(RefreshController refreshController) {
    if (refreshController.isRefresh) {
      refreshController.refreshCompleted();
    }
    if (refreshController.isLoading) {
      refreshController.loadComplete();
    }
  }
}
