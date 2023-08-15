import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import './detail.dart';

  Dio dio=Dio();
class MovieList extends StatefulWidget {
  final String mt;
  const MovieList({super.key, required this.mt});

  @override
  State<MovieList> createState() => _MovieListState();
}

//持久化 with
class _MovieListState extends State<MovieList> with AutomaticKeepAliveClientMixin{

  //持久化
  @override
  bool get wantKeepAlive =>true;
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: mlist.length,
      itemBuilder: (BuildContext context, int index) {
        //每次循环，都拿到当前的电影Item项
        var mItem = mlist[index];
        return GestureDetector(
          onTap: (){
            //跳转页面
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context){
                  return MovieDetail(
                    id:mItem['id'] ,
                    title:mItem['title'] ,
                  );
            }));
          },
          child: Container(
            height: 200,
            decoration: BoxDecoration(
                color: Colors.white,border: Border(
                top: BorderSide(color: Colors.black12)
            )
            ),
            child: Row(
              children: [
                Image.network(mItem['images']['small'],
                    width: 130,height: 180,fit: BoxFit.cover),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('电影名称:${mItem['titlee']}'),
                      Text('上映年份:${mItem['year']}年'),
                      Text('电影类型:${mItem['genres'].join(',')}'),
                      Text('豆瓣评分:${mItem['rating']['average']}分'),
                      Text('主要演员:${mItem['title']}'),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },

    );

  }

  //默认显示第一页数据
  int page = 1;
  //每页显示的数据条数
  int pagesize = 10;
  //电影列表数据
  var mlist = [];
  //总数据条数，实现分页效果
  var total=0;

  void initState(){
    super.initState();
    getMovieList();
  }


  //获取电影列表数据
  getMovieList() async{
    //js 偏移量的计算公式（page - 1）* pagesize
    int offset = (page - 1) * pagesize;
   var response=await dio.get('http://www.liulongbin.top:3005/api/v2/movie/${widget.mt}?start=$offset&count=$pagesize');

   //服务器返回数据
    var result= response.data;
    print(result);

    //将返回的数据赋予mlist
    setState(() {
      mlist=result['subjects'];
      total=result['total'];
    });
  }

}
