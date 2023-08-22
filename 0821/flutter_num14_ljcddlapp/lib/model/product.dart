import 'package:flutter/foundation.dart';

//产品列表项数据转换
class ProductItemModal{
  String desc;
  String type;
  String name;
  String imageUrl;
  String point;

  ProductItemModal({required this.desc,required this.type,required this.name,required this.imageUrl,required this.point});


  factory ProductItemModal.fromJson(dynamic json){
    return ProductItemModal(
      desc:json['desc'],
      type:json['type'],
      name:json['name'],
      imageUrl:json['imageUrl'],
      point: json['point'],
    );
}


}


//产品列表数据转换
class ProductListModal{

  List<ProductItemModal> data;
  ProductListModal(this.data);

  factory ProductListModal.fromJson(List json){
    return ProductListModal(json.map((e) => ProductItemModal.fromJson(e)).toList());
  }
}