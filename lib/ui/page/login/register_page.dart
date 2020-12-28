import 'package:flutter/material.dart';
import 'package:mall/constant/app_colors.dart';
import 'package:mall/constant/app_dimens.dart';
import 'package:mall/constant/app_strings.dart';
import 'package:mall/constant/text_style.dart';
import 'package:mall/ui/widgets/loading_dialog.dart';
import 'package:mall/ui/widgets/fm_icon.dart';
import 'package:mall/utils/toast_util.dart';
import 'package:mall/view_model/register_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatelessWidget {
  GlobalKey<FormState> _registerKey = GlobalKey<FormState>();
  TextEditingController _accountController = TextEditingController();
  TextEditingController _passWordController = TextEditingController();
  RegisterViewModel _registerViewModel = RegisterViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.COLOR_FFFFFF,
      appBar: AppBar(
        title: Text(AppStrings.REGISTER),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(
                left: ScreenUtil().setWidth(AppDimens.DIMENS_60),
                right: ScreenUtil().setWidth(AppDimens.DIMENS_60),
                top: ScreenUtil().setWidth(AppDimens.DIMENS_160)),
            child: Form(
                key: _registerKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.REGISTER_WELCOME,
                      style: FMTextStyle.color_333333_size_60,
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: ScreenUtil().setHeight(AppDimens.DIMENS_20))),
                    Text(
                      AppStrings.LOGIN_APP_INTRODUCE,
                      style: FMTextStyle.color_999999_size_36,
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: ScreenUtil().setHeight(AppDimens.DIMENS_100))),
                    TextFormField(
                      maxLines: 1,
                      maxLength: 11,
                      keyboardType: TextInputType.phone,
                      validator: _validatorAccount,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.account_circle,
                          color: AppColors.COLOR_999999,
                          size: ScreenUtil().setWidth(AppDimens.DIMENS_80),
                        ),
                        hintText: AppStrings.ACCOUNT_HINT,
                        hintStyle: FMTextStyle.color_999999_size_36,
                        labelStyle: FMTextStyle.color_333333_size_42,
                        labelText: AppStrings.ACCOUNT,
                      ),
                      controller: _accountController,
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: ScreenUtil().setHeight(AppDimens.DIMENS_20))),
                    TextFormField(
                      maxLines: 1,
                      maxLength: 12,
                      obscureText: true,
                      validator: _validatorPassWord,
                      decoration: InputDecoration(
                        icon: Icon(
                          FMICon.PASS_WORD,
                          color: AppColors.COLOR_999999,
                          size: ScreenUtil().setWidth(AppDimens.DIMENS_80),
                        ),
                        hintText: AppStrings.PASSWORD_HINT,
                        hintStyle: FMTextStyle.color_999999_size_36,
                        labelStyle: FMTextStyle.color_333333_size_42,
                        labelText: AppStrings.PASSWORD,
                      ),
                      controller: _passWordController,
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: ScreenUtil().setHeight(AppDimens.DIMENS_80))),
                    SizedBox(
                      width: double.infinity,
                      height: ScreenUtil().setHeight(AppDimens.DIMENS_120),
                      child: RaisedButton(
                        color: AppColors.COLOR_FF5722,
                        onPressed: () {
                          _register(context);
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(AppDimens.DIMENS_30))),
                        child: Text(
                          AppStrings.IMMEDIATELY_REGISTER,
                          style: FMTextStyle.color_ffffff_size_42,
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }

  void _register(BuildContext context) {
    if (_registerKey.currentState.validate()) {
      _showRegisterDialog(context);
      _registerViewModel
          .register(_accountController.text, _passWordController.text)
          .then((response) {
        Navigator.pop(context);
        if (response) {
          ToastUtil.showToast(AppStrings.REGISTER_SUCCESS);
          Navigator.pop(context);
        }
      });
    }
  }

  _showRegisterDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return LoadingDialog(
            title: AppStrings.LOGINING,
            textColor: AppColors.COLOR_999999,
            titleSize: AppDimens.DIMENS_42,
            indicatorRadius: AppDimens.DIMENS_60,
          );
        });
  }

  String _validatorAccount(String value) {
    if (value == null || value.length < 11) {
      return AppStrings.ACCOUNT_RULE;
    }
    return null;
  }

  String _validatorPassWord(String value) {
    if (value == null || value.length < 6) {
      return AppStrings.PASSWORD_HINT;
    }
    return null;
  }
}
