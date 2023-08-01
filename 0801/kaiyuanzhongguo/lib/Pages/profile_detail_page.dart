import 'package:flutter/material.dart';

//被复制了300多行，这页暂时报废
class ProfileDetailPage extends StatefulWidget {
  const ProfileDetailPage({Key? key}) : super(key: key);

  @override
  _ProfileDetailPageState createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '用户详情',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: <Widget>[
          //头像
          InkWell(
            onTap: () {},
            child: Container(
              child: Row(
                children: <Widget>[
                  Text('data'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
