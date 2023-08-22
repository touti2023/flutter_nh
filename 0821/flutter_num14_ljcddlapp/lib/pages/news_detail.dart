import 'package:flutter/material.dart';
import '../model/news.dart';



class NewsDetail extends StatelessWidget {
  final NewsItemModal item;

  NewsDetail({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: Padding(padding: EdgeInsets.all(16),
            child: Text(item.content),)

      );

  }
}