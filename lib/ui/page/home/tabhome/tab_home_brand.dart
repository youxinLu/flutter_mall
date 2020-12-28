import 'package:flutter/material.dart';
import 'package:mall/constant/app_colors.dart';
import 'package:mall/constant/app_dimens.dart';
import 'package:mall/constant/app_strings.dart';
import 'package:mall/constant/text_style.dart';
import 'package:mall/model/home_entity.dart';
import 'package:mall/ui/widgets/cached_image.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabHomeBrand extends StatelessWidget {
  List<HomeModelBrandlist> brands;
  String title;
  TabHomeBrand(this.title,this.brands);

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left:ScreenUtil().setWidth(AppDimens.DIMENS_30),right: ScreenUtil().setWidth(AppDimens.DIMENS_30)),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: ScreenUtil().setHeight(AppDimens.DIMENS_120),
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: FMTextStyle.color_333333_size_42_bold,
            ),
          ), ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: brands.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return _itemView(context,brands[index]);
              }),
        ],
      ),
    );
  }

  _goBrandDetail(BuildContext context, HomeModelBrandlist brand) {
    NavigatorUtil.goBrandDetail(context, brand.name, brand.id);
  }

  Widget _itemView(BuildContext context, HomeModelBrandlist brand) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Container(
        child: InkWell(
          onTap: () => _goBrandDetail(context, brand),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: CachedImageView(double.infinity,
                    ScreenUtil().setHeight(AppDimens.DIMENS_400), brand.picUrl),
              ),
              Container(
                  padding: EdgeInsets.only(
                      top: ScreenUtil().setHeight(AppDimens.DIMENS_30),
                      left: ScreenUtil().setWidth(AppDimens.DIMENS_30)),
                  child: Text(
                    brand.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: FMTextStyle.color_333333_size_42
                  )),
              Container(
                  padding: EdgeInsets.only(
                      top: ScreenUtil().setHeight(AppDimens.DIMENS_30),
                      left: ScreenUtil().setWidth(AppDimens.DIMENS_30)),
                  child: Text(
                    brand.desc,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:FMTextStyle.color_999999_size_42
                  )),
              Container(
                  padding: EdgeInsets.only(
                      top: ScreenUtil().setHeight(AppDimens.DIMENS_30),
                      left: ScreenUtil().setWidth(AppDimens.DIMENS_30),
                      bottom: ScreenUtil().setHeight(AppDimens.DIMENS_30)),
                  child: Text(
                    AppStrings.DOLLAR + "${brand.floorPrice}",
                    style:FMTextStyle.color_ff5722_size_42
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
