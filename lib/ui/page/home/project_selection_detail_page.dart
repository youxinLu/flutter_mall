import 'package:flutter/material.dart';
import 'package:mall/constant/app_colors.dart';
import 'package:mall/constant/app_dimens.dart';
import 'package:mall/constant/app_strings.dart';
import 'package:mall/constant/text_style.dart';
import 'package:mall/model/goods_entity.dart';
import 'package:mall/model/project_selection_detail_entity.dart';
import 'package:mall/ui/widgets/cached_image.dart';
import 'package:mall/ui/widgets/empty_data.dart';
import 'package:mall/ui/widgets/goods_widget.dart';
import 'package:mall/ui/widgets/loading_dialog.dart';
import 'package:mall/ui/widgets/network_error.dart';
import 'package:mall/ui/widgets/view_model_state_widget.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:mall/view_model/page_state.dart';
import 'package:provider/provider.dart';
import 'package:mall/view_model/project_selection_view_model.dart';
import "package:flutter_html/flutter_html.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectSelectionDetailView extends StatefulWidget {
  final int id;

  ProjectSelectionDetailView(this.id);

  @override
  _ProjectSelectionDetailViewState createState() =>
      _ProjectSelectionDetailViewState();
}

class _ProjectSelectionDetailViewState
    extends State<ProjectSelectionDetailView> {
  ProjectSelectionViewModel _projectSelectionViewModel =
      ProjectSelectionViewModel();

  @override
  void initState() {
    super.initState();
    _projectSelectionViewModel.queryDetail(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.PROJECT_SELECTION_DETAIL),
          centerTitle: true,
        ),
        body: ChangeNotifierProvider(
          create: (_) => _projectSelectionViewModel,
          child: Consumer<ProjectSelectionViewModel>(
              builder: (context, model, child) {
            return _initView(model);
          }),
        ));
  }

  Widget _initView(ProjectSelectionViewModel projectSelectionViewModel) {

    if (projectSelectionViewModel.pageState == PageState.hasData) {
      return _contentView(projectSelectionViewModel);
    }
    return ViewModelStateWidget.stateWidgetWithCallBack(
        projectSelectionViewModel, (){});
  }

  Widget _contentView(ProjectSelectionViewModel projectSelectionViewModel) {
    return Container(
        child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Html(
              data: projectSelectionViewModel
                  .projectSelectionDetailTopic.content
                  .replaceAll("//", "http://")),
          Padding(
            padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(AppDimens.DIMENS_30)),
          ),
          Container(
            margin: EdgeInsets.all(ScreenUtil().setWidth(AppDimens.DIMENS_30)),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing:
                        ScreenUtil().setHeight(AppDimens.DIMENS_20),
                    crossAxisSpacing:
                        ScreenUtil().setWidth(AppDimens.DIMENS_20),
                    childAspectRatio: 0.8),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: projectSelectionViewModel.goods.length,
                itemBuilder: (BuildContext context, int index) {
                  return _getGridViewItem(
                      projectSelectionViewModel.goods[index]);
                }),
          ),
          Container(
            height: ScreenUtil().setHeight(AppDimens.DIMENS_60),
            alignment: Alignment.center,
            child: Text(
              AppStrings.RECOMMEND_PROJECT_SELECTION,
              style:FMTextStyle.color_333333_size_26
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: _projectSelectionViewModel
                  .relatedProjectSelectionDetailTopics.length,
              itemBuilder: (BuildContext context, int index) {
                return _itemView(_projectSelectionViewModel
                    .relatedProjectSelectionDetailTopics[index]);
              })
        ],
      ),
    ));
  }

  _goGoodsDetail(int goodsId) {
    NavigatorUtil.goGoodsDetails(context, goodsId);
  }

  Widget _getGridViewItem(GoodsEntity productEntity) {
    return GoodsWidget(productEntity, (id) => _goGoodsDetail(id));
  }

  Widget _itemView(ProjectSelectionDetailTopic related) {
    return Container(
      margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(AppDimens.DIMENS_30),
          right: ScreenUtil().setWidth(AppDimens.DIMENS_30),
          top: ScreenUtil().setHeight(AppDimens.DIMENS_30)),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => _goDetail(related.id),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  width: double.infinity,
                  child: CachedImageView(
                      double.infinity,
                      ScreenUtil().setHeight(AppDimens.DIMENS_400),
                      related.picUrl)),
              Padding(
                  padding: EdgeInsets.only(
                      top: ScreenUtil().setHeight(AppDimens.DIMENS_20))),
              Container(
                  margin: EdgeInsets.only(
                      left: ScreenUtil().setWidth(AppDimens.DIMENS_30),
                      right: ScreenUtil().setWidth(AppDimens.DIMENS_30),
                      top: ScreenUtil().setHeight(AppDimens.DIMENS_30)),
                  child: Text(
                    related.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: FMTextStyle.color_333333_size_42
                  )),
              Container(
                  margin: EdgeInsets.only(
                      left: ScreenUtil().setWidth(AppDimens.DIMENS_30),
                      right: ScreenUtil().setWidth(AppDimens.DIMENS_30),
                      top: ScreenUtil().setHeight(AppDimens.DIMENS_30)),
                  child: Text(
                    related.subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: FMTextStyle.color_333333_size_42
                  )),
              Container(
                  margin: EdgeInsets.only(
                      bottom: ScreenUtil().setHeight(AppDimens.DIMENS_30),
                      left: ScreenUtil().setWidth(AppDimens.DIMENS_30),
                      right: ScreenUtil().setWidth(AppDimens.DIMENS_30),
                      top: ScreenUtil().setHeight(AppDimens.DIMENS_30)),
                  child: Text(
                    AppStrings.DOLLAR + "${related.price}",
                    style:FMTextStyle.color_ff5722_size_42
                  )),
            ],
          ),
        ),
      ),
    );
  }

  _goDetail(int id) {
    _projectSelectionViewModel.queryDetail(widget.id);
  }
}
