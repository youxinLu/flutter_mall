import 'package:flutter/material.dart';
import 'package:mall/constant/app_dimens.dart';
import 'package:mall/constant/app_strings.dart';
import 'package:mall/constant/text_style.dart';
import 'package:mall/model/goods_entity.dart';
import 'package:mall/ui/widgets/cached_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef ItemClick(int value);

class GoodsWidget extends StatelessWidget {
  GoodsEntity _goodsEntity;
  ItemClick _itemClick;

  GoodsWidget(this._goodsEntity, this._itemClick);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        child: GestureDetector(
          child: Card(
            child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    CachedImageView(
                      ScreenUtil().setHeight(AppDimens.DIMENS_400),
                      ScreenUtil().setHeight(AppDimens.DIMENS_400),
                      _goodsEntity.picUrl,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: ScreenUtil().setHeight(AppDimens.DIMENS_20),
                          left: ScreenUtil().setWidth(AppDimens.DIMENS_20),
                          right: ScreenUtil().setWidth(AppDimens.DIMENS_20)),
                      child: Text(
                          _goodsEntity.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:FMTextStyle.color_333333_size_42
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: ScreenUtil().setHeight(AppDimens.DIMENS_20))),
                    Text(
                        "${AppStrings.DOLLAR}${_goodsEntity.retailPrice}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: FMTextStyle.color_ff5722_size_42
                    ),
                  ],
                )),
          ),
          onTap: () => _itemClick(_goodsEntity.id),
        ),
      )
    );
  }
}
