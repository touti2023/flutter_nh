import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class HttpDemo extends StatelessWidget {
  const HttpDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HttpDemo'),
        elevation: 0.0,
      ),
      body: HttpDemoHome(),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  const HttpDemoHome({Key? key}) : super(key: key);

  @override
  _HttpDemoHomeState createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //fetchPost();
    //演示map，注销 fetchPost();
    final post = {'title': 'hello', 'description': 'nixe to meei you.'};

    print(post['title']);
    print(post['description']);

    //有时传递数据需要将map转换为json类型： json.encode(内容)
    final postJson = json.encode(post);
    print(postJson);

    //反向转换，将json转换成map类型： json.decode(内容);
    final postJsonConverted = json.decode(postJson);
    print('===========================');
    print(postJsonConverted['title']);
    print(postJsonConverted['description']);
    print(postJsonConverted is Map);

    final postModel = Post.fromJson(postJsonConverted);
    print('title;${postModel.title},description:${postModel.description}');

    print('${json.encoder}');
  }

  fetchPost() async {
    //gpt提供的方法，宁浩的已经不能用了
    Uri myUri = Uri.parse(
        'https://www.bilibili.com/video/BV1gb41157g9?p=38&spm_id_from=pageDriver&vd_source=18cf74d43919b8892c064f8389710cc4');

    final response = await http.get(myUri);
    //打印响应号码：200表示正连接成功
    print('statusCode:${response.statusCode}');
    //打印内容
    print('body:${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  //futureBuilder 构建小部件
  // @override
  // Widget build(BuildContext context) {
  //   //return FutureBuilder();
  // }
  //这里没完，参照gpt会清晰很多
}

class Post {
  final String title;
  final String description;

  Post(this.title, this.description);

  Post.fromJson(Map json)
      : title = json['title'],
        description = json['description'];

  Map? toJson() {
    return {'title': title, 'description': description};
  }
}
