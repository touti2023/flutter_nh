import 'package:flutter/foundation.dart';

//产品列表项数据转换
class NewsItemModal{
  String author;
  String title;
  String content;


  NewsItemModal({required this.author,required this.title,required this.content});


  factory NewsItemModal.fromJson(dynamic json){
    return NewsItemModal(
      author:json['author'],
      title:json['title'],
      content:json['content'],

    );
  }


}


//产品列表数据转换
class NewsListModal{

  List<NewsItemModal> data;
  NewsListModal(this.data);

  factory NewsListModal.fromJson(List json){
    return NewsListModal(json.map((e) => NewsItemModal.fromJson(e)).toList());
  }
}