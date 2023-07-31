import 'package:flutter/material.dart';
import 'package:kaiyuanzhongguo/common/event_bus.dart';
import 'package:kaiyuanzhongguo/utils/data_utils.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          '设置',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              //退出登录
              DataUtils.clearLoginInfo().then((value) {
                eventBus.fire(LogoutEvent());
                Navigator.of(context).pop();
              });
            },
            child: Text(
              '退出登录',
              style: TextStyle(fontSize: 25.0),
            )),
      ),
    );
  }
}
