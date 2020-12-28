import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mall/constant/app_colors.dart';
import 'package:mall/constant/app_images.dart';

class CachedImageView extends StatelessWidget {
  final double width;
  final double height;
  final String url;

  CachedImageView(this.width, this.height, this.url);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      alignment: Alignment.center,
      child: CachedNetworkImage(
        imageUrl: this.url,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
        placeholder: (BuildContext context, String url) {
          return Container(
            color: AppColors.COLOR_F0F0F0,
            alignment: Alignment.center,
            child: Image.asset(
              AppImages.DEFAULT_PICTURE,
              fit: BoxFit.fill,
            ),
          );
        },
      ),
    );
  }
}
