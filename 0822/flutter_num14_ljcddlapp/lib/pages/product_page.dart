import 'package:flutter/material.dart';
import '../model/product.dart';
import '../services/product.dart';
import './product_list_page.dart';

class ProductPage extends StatefulWidget {


  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  ProductListModal listData = ProductListModal([]);

  int page = 0;
  //翻页+获取产品列表数据
  void getProductList()async {

    var data= await getProductResult(page++);
    ProductListModal list = ProductListModal.fromJson(data);

    setState(() {

      listData.data.addAll(list.data);
    });
  }

  @override
  void initState() {
    super.initState();
    getProductList();
  }


  @override
  Widget build(BuildContext context) {
    return ProductResultListWidget(list: listData, getNextPAge: ()=> getProductList(),);
  }
}

