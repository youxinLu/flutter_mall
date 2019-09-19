import 'package:flutter/material.dart';
import 'package:mall/entity/project_selection_detail_entity.dart';
import 'package:mall/service/goods_service.dart';
import 'package:mall/widgets/futurebuilder_widget.dart';
import "package:flutter_html/flutter_html.dart";
import 'package:mall/constant/string.dart';
import 'package:mall/utils/toast_util.dart';
import 'package:mall/widgets/loading_dialog.dart';
import 'package:mall/widgets/network_error.dart';
import 'package:mall/entity/project_selection_recommed_entity.dart';
import "package:mall/utils/navigator_util.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mall/widgets/cached_image.dart';

class ProjectSelectionDetailView extends StatefulWidget {
  int id;

  ProjectSelectionDetailView(this.id);

  @override
  _ProjectSelectionDetailViewState createState() =>
      _ProjectSelectionDetailViewState();
}

class _ProjectSelectionDetailViewState
    extends State<ProjectSelectionDetailView> {
  GoodsService _goodsService = GoodsService();
  ProjectSelectionDetailEntity _projectSelectionDetailEntity;
  ProjectSelectionRecommedEntity _projectSelectionRecommedEntity;
  Future _future;

  @override
  void initState() {
    super.initState();
    _queryProjectSelection();
  }

  _queryProjectSelection() {
    var parameters = {"id": widget.id};
    _future = _goodsService.projectSelectionDetail(parameters, (success) {
      setState(() {
        _projectSelectionDetailEntity = success;
      });
    }, (error) {}).then((_) {
      _queryRecommend();
    });
  }

  _queryRecommend() {
    var parameters = {"id": widget.id};
    _goodsService.projectSelectionRecommend(parameters, (success) {
      setState(() {
        _projectSelectionRecommedEntity = success;
      });
    }, (error) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Strings.PROJECT_SELECTION_DETAIL),
          centerTitle: true,
        ),
        body: FutureBuilderWidget(_future, LoadingDialog(),
            NetWorkErrorView(_queryProjectSelection), _contentView()));
  }

  Widget _contentView() {
    return _projectSelectionDetailEntity != null &&
        _projectSelectionRecommedEntity != null
        ? Container(
        child: SingleChildScrollView(
            child: Column(
                children: <Widget>[
            Html(
            data: _projectSelectionDetailEntity.topic.content
                .replaceAll("//", "http://")),
        Padding(
          padding:
          EdgeInsets.only(top: ScreenUtil.instance.setHeight(10.0)),
        ),
        GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: ScreenUtil.instance.setHeight(10.0),
                crossAxisSpacing: ScreenUtil.instance.setWidth(10.0),
                childAspectRatio: 0.9),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
              itemCount: _projectSelectionDetailEntity.goods!=null?_projectSelectionDetailEntity.goods.length:0,
            itemBuilder: (BuildContext context, int index) {
              return _getGridViewItem(
                  _projectSelectionDetailEntity.goods[index]);
            }),
        Container(
          height: 40.0,
          alignment: Alignment.center,
          child: Text(
            Strings.RECOMMEND_PROJECT_SELECTION,
            style: TextStyle(
                color: Colors.black54,
                fontSize: ScreenUtil.instance.setSp(26.0)),
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _projectSelectionRecommedEntity.recommed != null
                ? _projectSelectionRecommedEntity.recommed.length
                : 0,
        itemBuilder: (BuildContext context, int index) {
          return _itemView(
              _projectSelectionRecommedEntity.recommed[index]);
        })
    ],
    ),
    ))
        : LoadingDialog();
  }

  _goGoodsDetail(Goods goods) {
    NavigatorUtils.goGoodsDetails(context, goods.id);
  }

  Widget _getGridViewItem(Goods productEntity) {
    return Container(
      child: InkWell(
        onTap: () => _goGoodsDetail(productEntity),
        child: Card(
          elevation: 2.0,
          margin: EdgeInsets.all(6.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(5.0),
                child: CachedImageView(
                    ScreenUtil.getInstance().setHeight(200.0),
                    ScreenUtil.getInstance().setHeight(200.0),
                    productEntity.picUrl),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4.0),
              ),
              Container(
                padding: EdgeInsets.only(left: 4.0, top: 4.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  productEntity.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black54, fontSize: 14.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4.0),
              ),
              Container(
                padding: EdgeInsets.only(left: 4.0, top: 4.0),
                alignment: Alignment.center,
                child: Text(
                  "￥${productEntity.retailPrice}",
                  style: TextStyle(color: Colors.red, fontSize: 12.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemView(Recommed recommend) {
    return Container(
      width: ScreenUtil.instance.setWidth(600.0),
      child: Card(
        child: InkWell(
          onTap: () => _goDetail(recommend.id),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  width: double.infinity,
                  child: CachedImageView(double.infinity,
                      ScreenUtil.instance.setHeight(260.0), recommend.picUrl)),
              Padding(
                  padding: EdgeInsets.only(
                      top: ScreenUtil.instance.setHeight(10.0))),
              Container(
                  padding:
                  EdgeInsets.only(left: ScreenUtil.instance.setWidth(10.0)),
                  child: Text(
                    recommend.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: ScreenUtil.instance.setSp(26.0)),
                  )),
              Padding(
                  padding:
                  EdgeInsets.only(top: ScreenUtil.instance.setHeight(6.0))),
              Container(
                  padding:
                  EdgeInsets.only(left: ScreenUtil.instance.setWidth(10.0)),
                  child: Text(
                    recommend.subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: ScreenUtil.instance.setSp(26.0)),
                  )),
              Padding(
                  padding:
                  EdgeInsets.only(top: ScreenUtil.instance.setHeight(6.0))),
              Container(
                  padding:
                  EdgeInsets.only(left: ScreenUtil.instance.setWidth(10.0)),
                  child: Text(
                    Strings.DOLLAR + "${recommend.price}",
                    style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontSize: ScreenUtil.instance.setSp(26.0)),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  _goDetail(int id) {
    NavigatorUtils.goProjectSelectionDetail(context, id, true);
  }
}
