import 'package:flutter/material.dart';
import './movies/list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green[100],
            title: Text(
              '电影列表',
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              )
            ],
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                //1//
                UserAccountsDrawerHeader(
                  accountName: Text('张三'),
                  accountEmail: Text(
                    '首席大法官',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://img0.baidu.com/it/u=345359896,661384602&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500'),
                  ),
                  //美化当前控件
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://img0.baidu.com/it/u=371636971,2688824806&fm=253&fmt=auto&app=138&f=JPEG?w=736&h=500'),
                          fit: BoxFit.cover)),
                ),

                //2
                ListTile(title: Text('用户反馈'), trailing: Icon(Icons.feedback)),
                ListTile(title: Text('系统设置'), trailing: Icon(Icons.settings)),
                ListTile(title: Text('我要发布'), trailing: Icon(Icons.send)),
                Divider(),
                ListTile(title: Text('注销'), trailing: Icon(Icons.exit_to_app)),
              ],
            ),
          ),
          //
          bottomNavigationBar: Container(
            decoration: BoxDecoration(color: Colors.green[100]),
            height: 60,
            child: TabBar(labelStyle: TextStyle(height: 0), tabs: [
              Tab(
                icon: Icon(Icons.movie_filter),
                text: '正在热映',
              ),
              Tab(
                icon: Icon(Icons.movie_creation),
                text: '即将上映',
              ),
              Tab(
                icon: Icon(Icons.local_movies),
                text: 'Top250',
              ),
            ]),
          ),
          body: TabBarView(children: [
            MovieList(mt: '正在热映'),
            MovieList(mt: '即将上映'),
            MovieList(mt: 'To250'),
          ]),
        ));
  }
}
