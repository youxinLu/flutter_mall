import 'package:flutter/material.dart';
import 'package:mall/constant/app_colors.dart';
import 'package:mall/constant/app_dimens.dart';
import 'package:mall/constant/app_strings.dart';
import 'package:mall/constant/text_style.dart';
import 'package:mall/model/home_entity.dart';
import 'package:mall/ui/widgets/cached_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabHomeGroupByWidget extends StatelessWidget {
  List<HomeModelGrouponlist> homeModelGroupLists;

  TabHomeGroupByWidget(this.homeModelGroupLists);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
              left: ScreenUtil().setWidth(AppDimens.DIMENS_30),
              top: ScreenUtil().setHeight(AppDimens.DIMENS_30),
              bottom: ScreenUtil().setHeight(AppDimens.DIMENS_30)),
          alignment: Alignment.centerLeft,
          child: Text(AppStrings.GROUP_BUG,
              style: FMTextStyle.color_333333_size_42_bold),
        ),
        ListView.builder(
            padding: EdgeInsets.all(0),
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: homeModelGroupLists.length,
            itemBuilder: (BuildContext context, int index) {
              return _getGroupBuyItem(homeModelGroupLists[index]);
            })
      ],
    );
  }

  Widget _getGroupBuyItem(HomeModelGrouponlist groupBuyEntity) {
    return Container(
        margin: EdgeInsets.only(
            left: ScreenUtil().setWidth(AppDimens.DIMENS_30),
            right: ScreenUtil().setWidth(AppDimens.DIMENS_30)),
          child: Card(
            child: Container(
              padding: EdgeInsets.only(
                  top: ScreenUtil().setHeight(AppDimens.DIMENS_20),
                  bottom: ScreenUtil().setHeight(AppDimens.DIMENS_20)),
              child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CachedImageView(
                    ScreenUtil().setWidth(AppDimens.DIMENS_180),
                    ScreenUtil().setWidth(AppDimens.DIMENS_180),
                    groupBuyEntity.picUrl),
                Container(
                  padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(AppDimens.DIMENS_20),
                  ),
                  width: ScreenUtil().setWidth(AppDimens.DIMENS_500),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(groupBuyEntity.name,
                          style: FMTextStyle.color_333333_size_42),
                      Padding(
                        padding: EdgeInsets.only(
                            top: ScreenUtil().setWidth(AppDimens.DIMENS_30)),
                      ),
                      Text(
                        groupBuyEntity.brief,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: FMTextStyle.color_999999_size_42,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: ScreenUtil().setWidth(AppDimens.DIMENS_30)),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "${AppStrings.ORIGINAL_PRICE}${groupBuyEntity.retailPrice}",
                            style: TextStyle(
                                fontSize:
                                ScreenUtil().setSp(AppDimens.DIMENS_42),
                                color: AppColors.COLOR_999999,
                                decoration: TextDecoration.lineThrough,
                                decorationStyle: TextDecorationStyle.dashed),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left:
                                ScreenUtil().setWidth(AppDimens.DIMENS_30)),
                          ),
                          Text(
                              "${AppStrings.CURRENT_PRICE}${groupBuyEntity.retailPrice}",
                              style: FMTextStyle.color_ff5722_size_42),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          height: ScreenUtil().setHeight(AppDimens.DIMENS_50),
                          padding: EdgeInsets.only(
                              left: ScreenUtil().setWidth(AppDimens.DIMENS_10),
                              right: ScreenUtil().setWidth(AppDimens.DIMENS_10)),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: new Border.all(
                                  color: AppColors.COLOR_FF5722,
                                  width:
                                  ScreenUtil().setHeight(AppDimens.DIMENS_1)),
                              // 边色与边宽度
                              borderRadius:
                              BorderRadius.circular(AppDimens.DIMENS_10),
                              color: Colors.white),
                          child: Text(
                            "${groupBuyEntity.grouponMember}${AppStrings.GROUP_FORMATION}",
                            style: FMTextStyle.color_ff5722_size_36,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: ScreenUtil().setWidth(AppDimens.DIMENS_10),
                              right: ScreenUtil().setWidth(AppDimens.DIMENS_20)),
                          height: ScreenUtil().setHeight(AppDimens.DIMENS_50),
                          padding: EdgeInsets.only(
                              left: ScreenUtil().setWidth(AppDimens.DIMENS_10),
                              right: ScreenUtil().setWidth(AppDimens.DIMENS_10)),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: new Border.all(
                                  color: AppColors.COLOR_FF5722,
                                  width:
                                  ScreenUtil().setHeight(AppDimens.DIMENS_1)),
                              // 边色与边宽度
                              borderRadius:
                              BorderRadius.circular(AppDimens.DIMENS_10),
                              color: Colors.white),
                          child: Text(
                            "${AppStrings.REDUCTION}${groupBuyEntity.grouponMember}",
                            style: FMTextStyle.color_ff5722_size_36,
                          ),
                        ),
                      ],
                    )),
              ],
            ),)
        ));
  }
}
