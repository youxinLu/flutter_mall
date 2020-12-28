import 'package:flutter/material.dart';
import 'package:mall/ui/widgets/empty_data.dart';
import 'package:mall/ui/widgets/loading_dialog.dart';
import 'package:mall/ui/widgets/network_error.dart';
import 'package:mall/view_model/base_view_model.dart';
import 'package:mall/view_model/page_state.dart';

class ViewModelStateWidget {
  static Widget stateWidget(BaseViewModel viewModel) {
    if (viewModel.pageState == PageState.loading) {
      return LoadingDialog();
    } else if (viewModel.pageState == PageState.error) {
      return NetWorkErrorView();
    } else if (viewModel.pageState == PageState.empty) {
      return EmptyDataView();
    }
  }

  static Widget stateWidgetWithCallBack(BaseViewModel viewModel,VoidCallback callback) {
    if (viewModel.pageState == PageState.loading) {
      return LoadingDialog();
    } else if (viewModel.pageState == PageState.error) {
      return NetWorkErrorView(callback: callback);
    } else   {
      return EmptyDataView();
    }
  }
}
