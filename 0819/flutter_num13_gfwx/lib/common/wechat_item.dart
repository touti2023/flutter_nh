import 'package:flutter/material.dart';
import './touch_callback.dart';

class WechatItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final Icon icon;

  WechatItem({required this.title, required this.imagePath, required this.icon})

  @override
  Widget build(BuildContext context) {
    return TouchCallBack(
      onPressed: () {
        switch (title) {
          case '朋友圈':
            Navigator.pushNamed(context, 'routeName');
            break;
          case '收藏':
            break;
        }
      },
      child: Container(
        height: 50,
        child: Row(
          children: [
            Container(
              child:
              imagePath != null?Image.network('src',
              width: 32,
                  height: 32,):
                  SizedBox(
                    height: 32,
                      width: 32,
                      child: icon,
                  ),
              margin: EdgeInsets.only(left: 22,right: 20),
            ),
            Text(title,style: TextStyle(fontSize: 16,
            color: Color(0xFF353535)),)
          ],
        ),
      ),);
  }
}
