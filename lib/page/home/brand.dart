import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mall/entity/home_entity.dart';
import 'package:mall/constant/string.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:mall/widgets/cached_image.dart';

class BrandView extends StatefulWidget {
  List<BrandList> brands;

  BrandView(this.brands);

  @override
  _BrandViewState createState() => _BrandViewState();
}

class _BrandViewState extends State<BrandView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: widget.brands.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return _itemView(widget.brands[index]);
          }),
    );
  }

  _goBrandDetail(BrandList brand) {
    NavigatorUtils.goBrandDetail(context, brand.name, brand.id);
  }

  Widget _itemView(BrandList brand) {
    return Card(
      child: Container(
        child: InkWell(
          onTap: () => _goBrandDetail(brand),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: CachedImageView(double.infinity,
                    ScreenUtil.instance.setWidth(260.0), brand.picUrl),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: ScreenUtil.instance.setHeight(10.0))),
              Container(
                  padding:
                      EdgeInsets.only(left: ScreenUtil.instance.setWidth(20.0)),
                  child: Text(
                    brand.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: ScreenUtil.instance.setSp(28.0)),
                  )),
              Padding(
                  padding:
                      EdgeInsets.only(top: ScreenUtil.instance.setHeight(6.0))),
              Container(
                  padding:
                      EdgeInsets.only(left: ScreenUtil.instance.setWidth(20.0)),
                  child: Text(
                    brand.desc,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: ScreenUtil.instance.setSp(26.0)),
                  )),
              Padding(
                  padding:
                      EdgeInsets.only(top: ScreenUtil.instance.setHeight(6.0))),
              Container(
                  padding: EdgeInsets.only(
                      left: ScreenUtil.instance.setWidth(20.0),
                      bottom: ScreenUtil.instance.setHeight(20.0)),
                  child: Text(
                    Strings.DOLLAR + "${brand.floorPrice}",
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
}
