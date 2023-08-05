import 'package:flutter/material.dart';

class ChildCategory with ChangeNotifier {
  List childCategroyList = [];
  int childIndex = 0; //子类高亮索引
  String categoryId = '4'; //大类的ID
  String subId = ''; //  小类
  int page = 1; //列表页数
  String noMoreText = ''; //显示没有数据的文字

  void getChildCategory(List list, String id) {
    page = 1;
    noMoreText = '';
    childIndex = 0;
    categoryId = id;
    subId = id;
    childCategroyList = list;
    notifyListeners();
  }

  //改变子类索引
  changeChildIndex(index, String id) {
    page = 1;
    noMoreText = '';
    childIndex = index;
    subId = id;
    notifyListeners();
  }

  //增加page的方法
  void addPage() {
    page++;
  }

  changeNoMore(String text) {
    noMoreText = text;
    notifyListeners();
  }
}
