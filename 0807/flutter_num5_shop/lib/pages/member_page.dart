import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('会员中心'),
      ),
      body: ListView(
        children: [_topHeader(), _orderTitle(), _olderType(), _actionList()],
      ),
    );
  }

  Widget _topHeader() {
    return Container(
      width: 750,
      padding: EdgeInsets.all(20),
      color: Colors.pinkAccent,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 30),
            child: ClipOval(
              child: Image.network('src'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(
              '技术胖',
              style: TextStyle(fontSize: 36, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }

  //我的订单标题

  Widget _orderTitle() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: ListTile(
        leading: Icon(Icons.list),
        title: Text('我的订单'),
        trailing: Icon(Icons.arrow_right),
        onTap: () {},
      ),
    );
  }

  Widget _olderType() {
    return Container(
      margin: EdgeInsets.only(
        top: 5,
      ),
      width: 750,
      height: 150,
      padding: EdgeInsets.only(top: 20),
      color: Colors.white,
      child: Row(
        children: [
          Container(
            width: 187,
            child: Column(
              children: [
                Icon(
                  Icons.party_mode,
                  size: 30,
                ),
                Text('待付款'),
              ],
            ),
          ),
          //=======================
          Container(
            width: 187,
            child: Column(
              children: [
                Icon(
                  Icons.query_builder,
                  size: 30,
                ),
                Text('待发货'),
              ],
            ),
          ),
          //=======================
          Container(
            width: 187,
            child: Column(
              children: [
                Icon(
                  Icons.directions,
                  size: 30,
                ),
                Text('待收货'),
              ],
            ),
          ),
          //=======================
          Container(
            width: 187,
            child: Column(
              children: [
                Icon(
                  Icons.pages_outlined,
                  size: 30,
                ),
                Text('待评价'),
              ],
            ),
          ),
          //=======================
        ],
      ),
    );
  }

  //通用list
  Widget _myListTitle(String title) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: ListTile(
        leading: Icon(Icons.blur_circular),
        title: Text(title),
        trailing: Icon(Icons.arrow_back),
      ),
    );
  }

  Widget _actionList() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          _myListTitle('领取优惠券'),
          _myListTitle('已领取优惠券'),
          _myListTitle('地址管理'),
          _myListTitle('客服电话'),
          _myListTitle('关于我们'),
        ],
      ),
    );
  }
}
