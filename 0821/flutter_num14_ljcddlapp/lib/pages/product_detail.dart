import 'package:flutter/material.dart';
import '../model/product.dart';



class ProductDetail extends StatelessWidget {
  final ProductItemModal item;

  ProductDetail({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(item.imageUrl,
            fit: BoxFit.cover,),
          Padding(padding: EdgeInsets.all(16),
            child: Text(item.desc),)
        ],
      ),
    );
  }
}