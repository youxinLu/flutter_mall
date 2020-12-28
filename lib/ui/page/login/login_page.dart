import 'package:flutter/material.dart';
import 'package:mall/constant/app_colors.dart';
import 'package:mall/constant/app_dimens.dart';
import 'package:mall/constant/app_strings.dart';
import 'package:mall/constant/text_style.dart';
import 'package:mall/ui/widgets/loading_dialog.dart';
import 'package:mall/ui/widgets/fm_icon.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:mall/utils/toast_util.dart';
import 'package:mall/view_model/cart_view_model.dart';
import 'package:mall/view_model/login_view_model.dart';
import 'package:mall/view_model/user_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  GlobalKey<FormState> _loginKey = GlobalKey<FormState>();
  TextEditingController _accountController = TextEditingController();
  TextEditingController _passWordController = TextEditingController();
  UserViewModel _userViewModel;
  LoginViewModel _loginViewModel;

  @override
  Widget build(BuildContext context) {
    _userViewModel = Provider.of<UserViewModel>(context);
    _loginViewModel = LoginViewModel(_userViewModel);
    return Scaffold(
      backgroundColor: AppColors.COLOR_FFFFFF,
      appBar: AppBar(
        title: Text(AppStrings.LOGIN),
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
                key: _loginKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.LOGIN_WELCOME,
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
                          FMICon.ACCOUNT,
                          color: AppColors.COLOR_FF5722,
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
                          color: AppColors.COLOR_FF5722,
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
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(AppDimens.DIMENS_30))),
                        color: AppColors.COLOR_FF5722,
                        onPressed: () {
                          _login(context);
                        },
                        child: Text(AppStrings.LOGIN,
                            style: FMTextStyle.color_ffffff_size_42),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: ScreenUtil().setHeight(AppDimens.DIMENS_42))),
                    Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(
                            right: ScreenUtil().setWidth(AppDimens.DIMENS_30)),
                        child: InkWell(
                          onTap: () => _goRegister(context),
                          child: Text(
                            AppStrings.IMMEDIATELY_REGISTER,
                            style: FMTextStyle.color_333333_size_42,
                          ),
                        ))
                  ],
                )),
          ),
        ),
      ),
    );
  }

  _goRegister(BuildContext context) {
    NavigatorUtil.goRegister(context);
  }

  void _login(BuildContext context) {
    FocusScope.of(context).unfocus();
    if (_loginKey.currentState.validate()) {
      showLoginDialog(context);
      _loginViewModel
          .login(_accountController.text, _passWordController.text)
          .then((response) {
        Navigator.pop(context);
        if (!response) {
          ToastUtil.showToast(_loginViewModel.errorMessage);
        } else {
          Provider.of<UserViewModel>(context, listen: false).refreshData();
          Provider.of<CartViewModel>(context, listen: false).queryCart();
          Navigator.pop(context);
        }
      }, onError: (error) {
        ToastUtil.showToast(_loginViewModel.errorMessage);
      });
    }
  }

  bool showLoginDialog(BuildContext context) {
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
