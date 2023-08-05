import 'package:flutter/material.dart';

class CategoryGoodsListProvide with ChangeNotifier {
  List<GategroyListData> goodsList = [];

  //点击大类时，更换商品列表
  getGoodsList(List<GategroyListData> list) {
    goodsList = list;
    notifyListeners();
  }
}
