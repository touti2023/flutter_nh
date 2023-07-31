import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kaiyuanzhongguo/Pages/profile_detail_page.dart';
import 'package:kaiyuanzhongguo/common/event_bus.dart';
import 'package:kaiyuanzhongguo/constants/constants.dart';
import 'package:kaiyuanzhongguo/constants/login_web_page.dart';
import 'package:kaiyuanzhongguo/utils/data_utils.dart';
import 'package:kaiyuanzhongguo/utils/net_util.dart';
import 'package:kaiyuanzhongguo/models/user.dart';

class PorfilePage extends StatefulWidget {
  const PorfilePage({Key? key}) : super(key: key);

  @override
  _PorfilePageState createState() => _PorfilePageState();
}

class _PorfilePageState extends State<PorfilePage> {
  List menuTitles = ['我的消息', '阅读记录', '我的博客', '我的问答', '我的活动', '我的团队', '邀请好友'];
  List menuIcons = [
    Icons.message,
    Icons.book,
    Icons.book_online_sharp,
    Icons.question_answer,
    Icons.interests,
    Icons.group,
    Icons.people,
  ];

  late String userAvatar;
  late String userName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //尝试获取用户信息
    _showUerInfo();
    eventBus.on<LoginEvent>().listen((event) {
      //获取用户信息并提示
      _getUerInfo();
    });
    eventBus.on<LogoutEvent>().listen((event) {
      //登出
      _showUerInfo();
    });
  }

  _getUerInfo() {
    DataUtils.getAccessToken().then((accessToken) {
      if (accessToken == null || accessToken.length == 0) {
        return;
      }
      Map<String, dynamic> params = Map<String, dynamic>();
      params['access_token'] = accessToken;
      params['dataType'] = 'json';

      NetUtils.get(AppUrls.OPENAPI_USER, params).then((data) {
        print('data:$data');
        Map<String, dynamic> map = json.decode(data);
        if (mounted) {
          setState(() {
            userAvatar = map['avatar'];
            userName = map['name'];
          });
        }
        DataUtils.saveUserInfo(map);
      });
    });
  }

  _showUerInfo() {
    DataUtils.getUserInfo().then((user) {
      if (mounted) {
        setState(() {
          if (user != null) {
            userAvatar = user.avatar;
            userName = user.name;
          } else {
            userAvatar = 'null';
            userName = 'null';
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildHeader();
          }
          index -= 1;
          return ListTile(
            leading: Icon(menuIcons[index]),
            title: Text(menuTitles[index]),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              DateUtils.isLogin().then((isLogin) {
                if (isLogin) {
                  switch (index) {
                    case 0:
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyMessagePage()));
                      break;
                    default:
                  }
                }
              });
            },
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: menuTitles.length + 1);
  }

  _login() async {
    final result = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => LoginWebPage()));
    if (result != null && result == 'refresh') {
      //登陆成功
      eventBus.fire(LoginEvent());
    }
  }

  Container _buildHeader() {
    return Container(
      height: 150.0,
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            child: userAvatar != null
                ? Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2.0),
                      image: DecorationImage(
                          image: NetworkImage(userAvatar), fit: BoxFit.cover),
                    ),
                  )
                : Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2.0),
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://img0.baidu.com/it/u=2594156704,713551222&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=501'),
                          fit: BoxFit.cover),
                    ),
                  ),
            onTap: () {
              // ignore: unnecessary_statements
              DataUtils.isLogin().then(
                (isLogin) {
                  if (isLogin) {
                    //详情
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ProfileDetailPage()));
                  } else {
                    //登陆执行
                    _login();
                  }
                },
              );
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            userName ??= '点击头像登陆',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}

 


// // ignore: camel_case_types
// class _buildHeader extends StatelessWidget {
//   const _buildHeader();

//  _login() async {
//     Navigator.of(context)
//         .push(MaterialPageRoute(builder: (context) => LoginWebPage()));
//   }
 
//   @override
//   Widget build(BuildContext context) {
    
// }
