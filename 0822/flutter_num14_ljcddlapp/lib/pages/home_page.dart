import 'package:flutter/material.dart';
import 'package:flutter_num14_ljcddlapp/pages/home_banner.dart';
import '../model/product.dart';
import '../services/product.dart';
import 'home_product_page.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  ProductListModal listData= ProductListModal([]);


  void getProductList()async{
    var data = await getProductResult();
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
    return Scaffold(
      body: ListView(
        children: [
          BannerWidget(),
          HomeProductPage(list: listData),

        ],
      ),
    );
  }
}
