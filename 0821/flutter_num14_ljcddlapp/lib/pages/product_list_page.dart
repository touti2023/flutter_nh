import 'package:flutter/material.dart';
import 'package:flutter_num14_ljcddlapp/pages/product_detail.dart';
import 'package:flutter_num14_ljcddlapp/style/font.dart';
import '../model/product.dart';
import '../style/color.dart';

class ProductResultListWidget extends StatelessWidget {
  //列表数据
  final ProductListModal list;

  //获取下一页数据
  final VoidCallback getNextPAge;

  ProductResultListWidget({required this.list, required this.getNextPAge});

  @override
  Widget build(BuildContext context) {
    return list.data.length == 0
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemCount: list.data.length,
            itemBuilder: (BuildContext context, int i) {
              //每4个加载一页
              ProductItemModal item = list.data[i];
              if ((i + 4) == list.data.length) {
                getNextPAge();
              }

              return GestureDetector(
                onTap: () {
                  Navigator.push(context,MaterialPageRoute( builder:(context)=>ProductDetail(item:item)));
                },
                //列表项背景
                child: Container(
                  color: ProductColors.bgColor,
                  padding: EdgeInsets.only(top: 5, right: 5),
                  child: Row(
                    children: [
                      Image.network(
                        item.imageUrl,
                        width: 120,
                        height: 120,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1,
                                    color: ProductColors.divideLineColor))),
                        //产品信息
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.desc,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                //产品类型
                                Text(
                                  item.type,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: ProductColors.typeColor,
                                  ),
                                ),
                                //产品特点
                                item.point == null
                                    ? SizedBox()
                                    : Container(
                                        child: Text(
                                          item.point,
                                          style: TextStyle(
                                              color: ProductColors.pointColor),
                                        ),
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 3),
                                        margin: EdgeInsets.only(left: 4),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1,
                                                color:
                                                    ProductColors.pointColor)),
                                      ),
                              ],
                            ),
                            Text(
                              item.name,
                              style: ProductFonts.itemNameStyle,
                            )
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              );
            });
  }
}
