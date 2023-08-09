import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/details_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsTabbar extends StatelessWidget {
  const DetailsTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailsInfoProvide>(
      builder: (context, detailsInfoProvide, child) {
        var isLeft = detailsInfoProvide.isLeft;
        var isRight = detailsInfoProvide.isRight;

        return Container(
          margin: EdgeInsets.only(top: 15.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  _myTabBarLeft(context, isLeft),
                  _myTabBarRight(context, isRight)
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _myTabBarLeft(BuildContext context, bool isLeft) {
    return InkWell(
      onTap: () {
        context.watch<DetailsInfoProvide>().changeLeftAndRight('left');
        ;
      },
      child: Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(375),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
                    width: 1.0, color: isLeft ? Colors.pink : Colors.black12))),
        child: Text(
          '详情',
          style: TextStyle(color: isLeft ? Colors.pink : Colors.black),
        ),
      ),
    );
  }

  Widget _myTabBarRight(BuildContext context, bool isRight) {
    return InkWell(
      onTap: () {
        context.watch<DetailsInfoProvide>().changeLeftAndRight('right');
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(375),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
                    width: 1.0,
                    color: isRight ? Colors.pink : Colors.black12))),
        child: Text(
          '评论',
          style: TextStyle(color: isRight ? Colors.pink : Colors.black),
        ),
      ),
    );
  }
}
