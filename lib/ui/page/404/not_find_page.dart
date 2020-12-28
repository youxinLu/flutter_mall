import 'package:flutter/material.dart';
import 'package:mall/constant/app_colors.dart';
import 'package:mall/constant/app_images.dart';
import 'package:mall/constant/app_strings.dart';


class NotFindPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(AppStrings.APP_NAME),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Image.asset(
            AppImages.NOT_FIND_PICTURE,
            width: 200,
            height: 100,
            color: AppColors.COLOR_FF5722,
          ),
        ));
  }
}
