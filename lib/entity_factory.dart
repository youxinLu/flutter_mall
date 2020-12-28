import 'package:mall/model/address_detail_entity.dart';
import 'package:mall/model/address_entity.dart';
import 'package:mall/model/brand_detail_entity.dart';
import 'package:mall/model/cart_entity.dart';
import 'package:mall/model/category_entity.dart';
import 'package:mall/model/category_goods_entity.dart';
import 'package:mall/model/category_title_entity.dart';
import 'package:mall/model/collection_entity.dart';
import 'package:mall/model/coupon_entity.dart';
import 'package:mall/model/fill_in_order_entity.dart';
import 'package:mall/model/foot_print_entity.dart';
import 'package:mall/model/goods_detail_entity.dart';
import 'package:mall/model/goods_entity.dart';
import 'package:mall/model/home_entity.dart';
import 'package:mall/model/order_detail_entity.dart';
import 'package:mall/model/order_list_entity.dart';
import 'package:mall/model/project_selection_detail_entity.dart';
import 'package:mall/model/related_project_selection_entity.dart';
import 'package:mall/model/search_goods_entity.dart';
import 'package:mall/model/user_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "AddressDetailEntity") {
      return AddressDetailEntity.fromJson(json) as T;
    } else if (T.toString() == "AddressEntity") {
      return AddressEntity.fromJson(json) as T;
    } else if (T.toString() == "BrandDetailEntity") {
      return BrandDetailEntity.fromJson(json) as T;
    } else if (T.toString() == "CartEntity") {
      return CartEntity.fromJson(json) as T;
    } else if (T.toString() == "CategoryList") {
      return CategoryList.fromJson(json) as T;
    } else if (T.toString() == "CategoryGoodsEntity") {
      return CategoryGoodsEntity.fromJson(json) as T;
    } else if (T.toString() == "CategoryTitleEntity") {
      return CategoryTitleEntity.fromJson(json) as T;
    } else if (T.toString() == "CollectionEntity") {
      return CollectionEntity.fromJson(json) as T;
    } else if (T.toString() == "CouponEntity") {
      return CouponEntity.fromJson(json) as T;
    } else if (T.toString() == "FillInOrderEntity") {
      return FillInOrderEntity.fromJson(json) as T;
    } else if (T.toString() == "FootPrintEntity") {
      return FootPrintEntity.fromJson(json) as T;
    } else if (T.toString() == "GoodsDetailEntity") {
      return GoodsDetailEntity.fromJson(json) as T;
    } else if (T.toString() == "GoodsEntity") {
      return GoodsEntity.fromJson(json) as T;
    } else if (T.toString() == "HomeEntity") {
      return HomeEntity.fromJson(json) as T;
    } else if (T.toString() == "OrderDetailEntity") {
      return OrderDetailEntity.fromJson(json) as T;
    } else if (T.toString() == "OrderListEntity") {
      return OrderListEntity.fromJson(json) as T;
    } else if (T.toString() == "ProjectSelectionDetailEntity") {
      return ProjectSelectionDetailEntity.fromJson(json) as T;
    } else if (T.toString() == "RelatedProjectSelectionEntity") {
      return RelatedProjectSelectionEntity.fromJson(json) as T;
    } else if (T.toString() == "SearchGoodsEntity") {
      return SearchGoodsEntity.fromJson(json) as T;
    } else if (T.toString() == "UserEntity") {
      return UserEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}