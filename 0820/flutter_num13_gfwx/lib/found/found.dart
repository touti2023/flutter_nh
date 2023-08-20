import 'package:flutter/material.dart';
import '../common/wechat_item.dart';


class Found extends StatefulWidget {


  @override
  State<Found> createState() => _Found();
}

class _Found extends State<Found> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Container(
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                color: Colors.white,
                child: WechatItem(title: '朋友圈', imagePath: null, icon: Icon(Icons.face_2)),
              ),
              //
              Container(
                margin: EdgeInsets.only(top: 20),
                color: Colors.white,
                child: Column(
                  children: [
                  WechatItem(title: '扫一扫', imagePath: null, icon: Icon(Icons.face_2)),
                  Padding(padding: EdgeInsets.only(left: 15,right: 15),
                  child: Divider(
                    height: 0.5,
                    color: Color(0xFFd9d9d9),
                  ),),
                    WechatItem(title: '摇一摇', imagePath: null, icon: Icon(Icons.access_alarms_outlined))
                  ],
                ),
                ),
      Container(
        margin: EdgeInsets.only(top: 20),
        color: Colors.white,
        child: Column(
          children: [
            WechatItem(title: '看一看', imagePath: null, icon: Icon(Icons.face_2)),
            Padding(padding: EdgeInsets.only(left: 15,right: 15),
              child: Divider(
                height: 0.5,
                color: Color(0xFFd9d9d9),
              ),),
            WechatItem(title: '搜一搜', imagePath: null, icon: Icon(Icons.access_alarms_outlined))
          ],
        ),
      ),
              Container(
                margin: EdgeInsets.only(top: 20),
                color: Colors.white,
                child: Column(
                  children: [
                    WechatItem(title: '附近的人', imagePath: null, icon: Icon(Icons.face_2)),
                    Padding(padding: EdgeInsets.only(left: 15,right: 15),
                      child: Divider(
                        height: 0.5,
                        color: Color(0xFFd9d9d9),
                      ),),
                    WechatItem(title: '漂流瓶', imagePath: null, icon: Icon(Icons.access_alarms_outlined))

                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                color: Colors.white,
                child: Column(
                  children: [
                    WechatItem(title: '购物', imagePath: null, icon: Icon(Icons.face_2)),
                    Padding(padding: EdgeInsets.only(left: 15,right: 15),
                      child: Divider(
                        height: 0.5,
                        color: Color(0xFFd9d9d9),
                      ),),
                    WechatItem(title: '游戏', imagePath: null, icon: Icon(Icons.access_alarms_outlined))
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 20),
                color: Colors.white,
                child: WechatItem(title: '小程序', imagePath: null, icon: Icon(Icons.access_alarms_outlined))
              ),
            ],
          ),
        ),
    );
  }
}
