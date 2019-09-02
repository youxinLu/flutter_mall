import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mall/constant/string.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CachedImageView extends StatelessWidget {
  double width;
  double height;
  String url;

  CachedImageView(this.width, this.height, this.url);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      alignment: Alignment.center,
      child: CachedNetworkImage(
        imageUrl: this.url,
        fit: BoxFit.fill,
        width: this.width,
        height: this.height,
        placeholder: (BuildContext context, String url) {
          return Container(
            width: this.width,
            color: Colors.grey[350],
            height: this.height,
            alignment: Alignment.center,
            child: Text(
              Strings.LOADING,
              style: TextStyle(
                  fontSize: ScreenUtil.instance.setSp(26.0),
                  color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
