import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/details_info.dart';
import './details_page/details_top_area.dart';
import './details_page/details_explain.dart';
import './details_page/details_tabbar.dart';
import './details_page/details_web.dart';
import './details_page/details_bottom.dart';

class DetailsPage extends StatelessWidget {
  final String goodsId;
  DetailsPage(this.goodsId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(' 商品详细页'),
      ),
      body: FutureBuilder(
        future: ,
        builder: (context,snapshot){
          if (snapshot.hasData) {
            return Stack(
              children: [
                Container(
              child: ListView(
                children: [
                  DetailsTopArea(),
                  DetailsExplain(),
                  DetailsTabbar(),
                  DetailsWed(),
                  DetailsBottom(),
                ],
              ),
            ),
             Positioned(
              bottom: 0,
              left: 0,
              child: Text('data')) ],
            );
          }
        }
      ),
    );
  }
  Future _getBakcInfo(BuildContext context) async{
await context.watch().getGoodsInfo(goodsId);
return ('加载完成');
}
}

