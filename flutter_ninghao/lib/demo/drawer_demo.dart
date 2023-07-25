import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "工藤新一",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: Text("kudou_1996@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://api.duniagames.co.id/api/content/upload/file/26494171664338614.jpg"),
            ),
            //头像背景
            decoration: BoxDecoration(
                color: Colors.yellow[400],
                image: DecorationImage(
                    image: NetworkImage(
                        "https://www.generasia.com/w/images/thumb/a/ac/KDCdorama.jpg/450px-KDCdorama.jpg"),
                    fit: BoxFit.cover,
                    //背景图与颜色融合高亮
                    colorFilter: ColorFilter.mode(
                        Colors.yellow[400]!.withOpacity(0.6),
                        BlendMode.hardLight))),
          ),
          ListTile(
            title: Text(
              "Messages",
              textAlign: TextAlign.right,
            ),
            trailing: Icon(
              Icons.message,
              color: Colors.black12,
              size: 22.0,
            ),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text(
              "Favorite",
              textAlign: TextAlign.right,
            ),
            trailing: Icon(
              Icons.favorite,
              color: Colors.black12,
              size: 22.0,
            ),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text(
              "Settings",
              textAlign: TextAlign.right,
            ),
            trailing: Icon(
              Icons.settings,
              color: Colors.black12,
              size: 22.0,
            ),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
