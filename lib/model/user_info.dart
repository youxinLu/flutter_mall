import 'package:flutter/material.dart';
import 'package:mall/entity/user_entity.dart';

class UserInfoModel with ChangeNotifier {
  UserEntity userEntity;

  updateInfo(UserEntity userEntity) {
    this.userEntity = userEntity;
    notifyListeners();
  }
}
