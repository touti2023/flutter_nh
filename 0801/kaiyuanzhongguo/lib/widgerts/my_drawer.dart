import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Pages/jump_page.dart';
import '../Pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer(
      {Key? key,
      required String headImgPath,
      required List<IconData> menuIcons,
      required List<String> menuTitles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 300.0,
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Image.network(
                    'https://img0.baidu.com/it/u=1275095085,1961143463&fm=253&fmt=auto&app=120&f=JPEG?w=1280&h=800',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  color: Colors.black.withOpacity(0.5),
                  child: Text(
                    '元和十年、予左遷九江郡司馬。明年秋、送客湓浦口、聞舟中夜弾琵琶者。聴其音錚錚然有京都声、問其人、本長安倡女、嘗学琵琶於穆曹ニ善才。年長色衰委身為賈人婦。遂命酒使快弾数曲。',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('发布动弹'),
            trailing: Icon(Icons.arrow_forward_ios),
            leading: Icon(
              FontAwesomeIcons.smileBeam,
              color: Colors.orange,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => JumpPage('发布动弹')));
            },
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text('动弹小黑屋'),
            trailing: Icon(Icons.arrow_forward_ios),
            leading: Icon(
              FontAwesomeIcons.sadCry,
              color: Colors.orange,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => JumpPage('动弹小黑屋')));
            },
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text('关于'),
            trailing: Icon(Icons.arrow_forward_ios),
            leading: Icon(
              FontAwesomeIcons.home,
              color: Colors.orange,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => JumpPage('关于')));
            },
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text('设置'),
            trailing: Icon(Icons.arrow_forward_ios),
            leading: Icon(
              FontAwesomeIcons.steam,
              color: Colors.orange,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SettingsPage()));
            },
          ),
        ],
      ),
    );
  }

  _navPush(BuildContext context, Widget page) {
    Navigator.of(context).pop();
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
