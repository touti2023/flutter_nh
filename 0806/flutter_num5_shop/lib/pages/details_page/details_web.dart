import 'package:flutter/material.dart';
import '../../provider/details_info.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_html/flutter_html.dart';

class DetailsWed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var goodsDetail =
        context.watch<DetailsInfoProvide>().goodsInfo.data.goodInfo.goodsDetail;

    return Consumer<DetailsInfoProvide>(
      builder: (context, detailsInfoProvide, child) {
        var isLeft = detailsInfoProvide.isLeft;
        if (isLeft) {
          return Container(
            child: Html(
              data: goodsDetail,
            ),
          );
        } else {
          return Container(
            width: ScreenUtil().setWidth(750),
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text('暂时没有数据'),
          );
        }
      },
    );
  }
}
