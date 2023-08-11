import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('大宝贝'),
            accountEmail: Text('TT123@qq.com'),
            currentAccountPicture: null,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://img0.baidu.com/it/u=3163024878,2396798217&fm=253&fmt=auto&app=120&f=JPEG?w=1280&h=800',
                ),
              ),
            ),
          ),
          // 文字项
          ListTile(
            title: Text(
              '首页',
              style: TextStyle(color: Colors.blue[600]),
            ),
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.blue,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text('翻译收藏夹'),
            leading: Icon(CupertinoIcons.location_solid),
            onTap: () {},
          ),
          ListTile(
            title: Text('离线翻译'),
            leading: Icon(CupertinoIcons.music_note),
            onTap: () {},
          ),
          ListTile(
            title: Text('设置'),
            leading: Icon(CupertinoIcons.settings),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
