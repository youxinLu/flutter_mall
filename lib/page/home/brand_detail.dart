import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mall/entity/brand_detail_entity.dart';
import 'package:mall/service/home_service.dart';
import 'package:mall/utils/toast_util.dart';
import 'package:mall/widgets/empty_view.dart';
import 'package:mall/widgets/cached_image.dart';

class BrandDetailView extends StatefulWidget {
  var titleName;
  var id;

  BrandDetailView(this.titleName, this.id);

  @override
  _BrandDetailViewState createState() => _BrandDetailViewState();
}

class _BrandDetailViewState extends State<BrandDetailView> {
  BrandDetailEntity _brandDetailEntity;
  HomeService _homeService = HomeService();

  @override
  void initState() {
    _getData();
  }

  _getData() {
    var parameters = {"id": widget.id};
    _homeService.queryBrandDetail(parameters, (success) {
      setState(() {
        _brandDetailEntity = success;
      });
    }, (error) {
      ToastUtil.showToast(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titleName),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: _brandDetailEntity != null
            ? Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      child: CachedImageView(
                          double.infinity,
                          ScreenUtil.instance.setWidth(300.0),
                          _brandDetailEntity.picUrl),
                    ),
                    Container(
                      margin:
                          EdgeInsets.all(ScreenUtil.instance.setWidth(20.0)),
                      child: Text(
                        _brandDetailEntity.desc,
                        style: TextStyle(
                            fontSize: ScreenUtil.instance.setSp(26.0),
                            color: Colors.black54),
                      ),
                    )
                  ],
                ),
              )
            : EmptyView(),
      ),
    );
  }
}
