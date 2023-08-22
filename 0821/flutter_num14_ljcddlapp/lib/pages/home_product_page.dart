import 'package:flutter/material.dart';
import 'package:flutter_num14_ljcddlapp/pages/product_detail.dart';
import '../model/product.dart';
import '../utils/utils.dart';


class HomeProductPage extends StatelessWidget {
  final ProductListModal list;
  HomeProductPage({required this.list});
  
  

  @override
  Widget build(BuildContext context) {

    double deviceWidth= MediaQuery.of(context).size.width;
    
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 10,bottom: 10,left: 7.5),
      child: _build(context,deviceWidth),
    );
  }
  
  Widget _build(BuildContext context,double deviceWidth){
    
    //Item宽度
    double itemWidth= deviceWidth*168.5/360;
    double imageWidth= deviceWidth*110/360;

    //返回产品列表
    List<Widget> listWidgets = list.data.map((e) {

      var bgColor = string2Color('#f8f8f8');
      Color titleColor = string2Color('#db5d41');
      Color subtitleColor = string2Color('#999999');

      return GestureDetector(
        onTap: (){
          Navigator.push(context,MaterialPageRoute( builder:(context)=>ProductDetail(item:e)));
        },
          child: Container(
            width: itemWidth,
            margin: EdgeInsets.only(bottom: 5,left: 2),
            padding: EdgeInsets.only(top: 10,left: 13,bottom: 7),
            color: bgColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(e.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15,color: titleColor),),

                //
                Text(e.desc,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15,color: subtitleColor),),

                //
                Container(
                  alignment: Alignment(0,0),
                  margin: EdgeInsets.only(top: 5),
                  child: Image.network(e.imageUrl),
                  width: imageWidth,
                  height: imageWidth,
                ),

              ],
            ),
          ),
      );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 5,right: 10),
          child: Text('最新产品',style: TextStyle(
            fontSize: 16,
            color: Color.fromRGBO(51, 51, 51, 1),
          ),),
        ),
        //流式布局列表
        Wrap(
          spacing: 2,
          children: listWidgets,
        ),
      ],
    );
  }
}
