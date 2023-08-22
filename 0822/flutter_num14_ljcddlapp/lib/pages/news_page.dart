import 'package:flutter/material.dart';
import '../model/news.dart';
import '../services/news.dart';
import 'news_detail.dart';

class NewsPage extends StatefulWidget {

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  NewsListModal listData = NewsListModal([]);

  //翻页+获取产品列表数据
  void getNewsList()async {
    var data= await getNewsResult();
    NewsListModal list = NewsListModal.fromJson(data);

    setState(() {
      listData.data.addAll(list.data);
    });
  }

  @override
  void initState() {
    super.initState();
    getNewsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.separated(
        separatorBuilder: (context,index)=>Divider(height: 1,),
        itemCount: listData.data.length,
          itemBuilder: (context,index){
        NewsItemModal  item=listData.data[index];
          return ListTile(
            title: Text(item.title),
            subtitle: Text(item.content),
            leading: Icon(Icons.fiber_new),
            trailing: Icon(Icons.arrow_forward),
            contentPadding: EdgeInsets.all(10),
            enabled: true,
            onTap: () {
              Navigator.push(context,MaterialPageRoute( builder:(context)=>
                  NewsDetail(item:item)));
            },
          );
          },
          ),
    );
  }
}

