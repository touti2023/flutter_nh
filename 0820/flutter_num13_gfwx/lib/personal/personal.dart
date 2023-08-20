import 'package:flutter/material.dart';
import '../common/touch_callback.dart';
import '../common/wechat_item.dart';

class Personal extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            color: Colors.white,
            height: 80,
            child: TouchCallBack(
                onPressed:(){ },
                child:Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 12,right: 15),
                      child: Icon(Icons.access_alarm_outlined,
                        ),
                    ),
                    Expanded(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('图图',style: TextStyle(fontSize: 18,color: Color(0xFF353535),
                        ),),
                        Text('微信号 tutu',
                        style: TextStyle(
                          fontSize: 14,color: Color(0xFFa9a9a9),
                        ),)
                      ],
                    )),
                    Container(
                      margin: EdgeInsets.only(left: 12,right: 15),
                      child: Icon(Icons.face_2,
                      ),
                    ),
                  ],
                ) ),
          ),

          Container(
            margin: EdgeInsets.only(left: 20,),
            color: Colors.white,
            child: WechatItem(title: '钱包', imagePath: null, icon: Icon(Icons.ac_unit_rounded)),
            ),


          Container(
            margin: EdgeInsets.only(top: 20),
            color: Colors.white,
            child: Column(
              children: [
                WechatItem(title: '收藏', imagePath: null, icon: Icon(Icons.dangerous)),
                Padding(padding: EdgeInsets.only(left: 15,right: 15),
                  child: Divider(
                    height: 0.5,
                    color: Color(0xFFd9d9d9),
                  ),),
                WechatItem(title: '相册', imagePath: null, icon: Icon(Icons.r_mobiledata)),
                Padding(padding: EdgeInsets.only(left: 15,right: 15),
                child: Divider(
                  height: 0.5,
                  color: Color(0xFFd9d9d9),
                ),),
                WechatItem(title: '卡包', imagePath: null, icon: Icon(Icons.ice_skating)),
                Padding(padding: EdgeInsets.only(left: 15,right: 15),
                  child: Divider(
                    height: 0.5,
                    color: Color(0xFFd9d9d9),
                  ),),
                WechatItem(title: '表情', imagePath: null, icon: Icon(Icons.safety_check)),



              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(left: 20,),
            color: Colors.white,
            child: WechatItem(title: '设置', imagePath: null, icon: Icon(Icons.wallet)),
          ),

        ],
      ),
    );
  }
}

