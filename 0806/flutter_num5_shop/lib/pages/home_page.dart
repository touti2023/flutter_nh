import 'package:flutter/material.dart';
import 'package:flutter_num5_shop/main.dart';
import 'package:flutter_num5_shop/routers/application.dart';
import 'package:flutter_num5_shop/service/service_method.dart';
import 'package:card_swiper/card_swiper.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:easy_refresh/easy_refresh.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
//保持页面不返回上面
    with
        AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  String homePageContent = '正在获取数据';

  //火爆专区变量
  int page = 1;
  List<Map> hotGoodsList = [];

  // GlobalKey<RefreshFooterState> _footerkey =
  //     new GlobalKey<RefreshFooterState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var formData = {'lon': '115.02932', 'lat': '35.76189'};
    return Scaffold(
      appBar: AppBar(
        title: Text('百姓生活+'),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: request('homePageContent', formData: formData),
            // ignore: non_constant_identifier_names
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //数据处理
                var data = json.decode(snapshot.data.toString());
                List<Map> swiper = (data['data']['slides'] as List).cast();
                List<Map> navigatorList =
                    (data['data']['category'] as List).cast();
                String adPicture =
                    data['data']['advertesPicture']['PICURE_ADDRESS'];
                String leaderImage = data['data']['shopInfo']['leaderImage'];
                String leaderPhone = data['data']['shopInfo']['leaderPhone'];
                List<Map> recommendList =
                    (data['data']['recommend'] as List).cast();
                String floor1Title =
                    data['data']['floor1Pic']['PICTURE_ADDRESS'];
                String floor2Title =
                    data['data']['floor2Pic']['PICTURE_ADDRESS'];
                String floor3Title =
                    data['data']['floor3Pic']['PICTURE_ADDRESS'];
                List<Map> floo1 = (data['data']['floor1Pic'] as List).cast();
                List<Map> floo2 = (data['data']['floor2Pic'] as List).cast();
                List<Map> floo3 = (data['data']['floor3Pic'] as List).cast();

                //上拉加载 刷新 EasyRefresh（）
                return EasyRefresh(
                  footer: ClassicFooter(
                    backgroundColor: Colors.white,
                    textStyle: TextStyle(
                      color: Colors.pink,
                    ),
                  ),
                  child: ListView(
                    children: <Widget>[
                      SwiperDiy(swiper),
                      TopNavigator(navigatorList),
                      AdBanner(adPicture),
                      LeaderPhone(
                          leaderImage: leaderImage, leaderPhone: leaderPhone),
                      Recommend(recommendList),
                      FloorTitle(floor1Title),
                      FloorContent(floo1),
                      FloorTitle(floor2Title),
                      FloorContent(floo2),
                      FloorTitle(floor3Title),
                      FloorContent(floo3),
                      _hotGoods(),
                    ],
                  ),
                  onLoad: () async {
                    print('开始加载更多');
                    var forData = {'page': page};
                    await request('homePageBelowConten', formData: forData)
                        .then((val) {
                      var data = json.decode(val.toString());
                      List<Map> newGoodsList = (data['data'] as List).cast();
                      setState(() {
                        hotGoodsList.addAll(newGoodsList);
                        page++;
                      });
                    });
                  },
                );
              } else {
                return Center(
                  child: Text('加载中......'),
                );
              }
            }),
      ),
    );
  }

  Widget hotTitle = Container(
    margin: EdgeInsets.only(top: 10),
    alignment: Alignment.center,
    color: Colors.transparent,
    padding: EdgeInsets.all(5),
    child: Text('火爆专区'),
  );

  Widget _wrapList() {
    if (hotGoodsList.length != 0) {
      List<Widget> listWidget = hotGoodsList.map((val) {
        return InkWell(
          onTap: () {},
          child: Container(
            width: ScreenUtil().setWidth(372),
            color: Colors.white,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(bottom: 3),
            child: Column(
              children: [
                Image.network(
                  val['Image'],
                  width: ScreenUtil().setWidth(370),
                ),
                Text(
                  val['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.pink, fontSize: ScreenUtil().setSp(26)),
                ),
                Row(
                  children: [
                    Text('¥${val['mallPrice']}'),
                    Text(
                      '¥${val['price']}',
                      style: TextStyle(
                          color: Colors.black26,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }).toList();

      return Wrap(
        spacing: 2,
        children: listWidget,
      );
    } else {
      return Text('');
    }
  }

  Widget _hotGoods() {
    return Container(
      child: Column(
        children: [hotTitle, _wrapList()],
      ),
    );
  }
}

//首页轮播组件
class SwiperDiy extends StatelessWidget {
  final List swiperDataList;
  SwiperDiy(this.swiperDataList);

  @override
  Widget build(BuildContext context) {
    //适应尺寸
    ScreenUtil.init(
      BoxConstraints(maxWidth: 750, maxHeight: 1334) as BuildContext,
      designSize: Size(750, 1334),
    );

    return Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemCount: swiperDataList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Application.router.navigateTo(
                  context, '/datatail?id=${swiperDateList[index]['goodsId']}');
            },
            child: Image.network('${swiperDataList[index]['image']}'),
          );
        },
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}

//网格导航栏
class TopNavigator extends StatelessWidget {
  late final List navigatorList;

  TopNavigator(this.navigatorList);

  Widget _gridViewItemUI(BuildContext context, item) {
    return InkWell(
      onTap: () {
        print('点击了导航');
      },
      child: Column(
        children: <Widget>[
          Image.network(
            item['image'],
            width: ScreenUtil().setWidth(95),
          ),
          Text(item['mallCategoryName'])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (this.navigatorList.length > 10) {
      this.navigatorList.removeRange(10, this.navigatorList.length);
    }
    return Container(
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        ///禁止滚动
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 5,
        padding: EdgeInsets.all(5.0),
        children: navigatorList.map((item) {
          return _gridViewItemUI(context, item);
        }).toList(),
      ),
    );
  }
}

//一键拨打店长电话模块
class LeaderPhone extends StatelessWidget {
  late final String leaderImage;
  late final String leaderPhone;

  LeaderPhone({required this.leaderImage, required this.leaderPhone});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: _launchURL,
        child: Image.network(leaderImage),
      ),
    );
  }

  void _launchURL() async {
    String url = //'http://www.baidu.com';
        'let' + leaderPhone;
    if (await canLaunchUrl(url as Uri)) {
      await launchUrl(url as Uri);
    } else {
      throw 'url异常';
    }
  }
}

//商品推荐，横向滑动

class Recommend extends StatelessWidget {
  late final List recommendList;

  Recommend(this.recommendList);

  //标题方法
  Widget _titleWidget() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 2.0, 0, 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5, color: Colors.black12),
        ),
      ),
      child: Text(
        '商品推荐',
        style: TextStyle(color: Colors.pink),
      ),
    );
  }

  //商品单独项方法
  Widget _item(context, index) {
    return InkWell(
      onTap: () {
        Application.router.navigateTo(
            context, '/datatail?id=${swiperDateList[index]['goodsId']}');
      },
      child: Container(
        height: ScreenUtil().setHeight(330),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              left: BorderSide(width: 1, color: Colors.black12),
            )),
        child: Column(
          children: <Widget>[
            Image.network(recommendList[index]['image']),
            Text('¥${recommendList[index]['mallPrice']}'),
            Text(
              '¥${recommendList[index]['price']}',
              style: TextStyle(
                  decoration: TextDecoration.lineThrough, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }

  //横向列表方法
  Widget recommedList() {
    return Container(
      height: ScreenUtil().setHeight(330),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommendList.length,
        itemBuilder: (context, index) {
          return _item(index);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(380),
      margin: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[_titleWidget(), recommedList()],
      ),
    );
  }
}

//楼层标题
class FloorTitle extends StatelessWidget {
  final String picture_address;

  FloorTitle(this.picture_address);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Image.network(picture_address),
    );
  }
}

//楼层商品列表
class FloorContent extends StatelessWidget {
  final List floorGoodsList;

  FloorContent(this.floorGoodsList);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_firstRow(), _otherGoods()],
    );
  }

  Widget _firstRow() {
    return Row(
      children: <Widget>[
        _goodsItem(floorGoodsList[0]),
        Column(
          children: <Widget>[
            _goodsItem(floorGoodsList[1]),
            _goodsItem(floorGoodsList[2]),
          ],
        ),
      ],
    );
  }

  Widget _otherGoods() {
    return Row(
      children: [
        _goodsItem(floorGoodsList[3]),
        _goodsItem(floorGoodsList[4]),
      ],
    );
  }

  Widget _goodsItem(BuildContext context, Map goods) {
    return Container(
      width: ScreenUtil().setWidth(375),
      child: InkWell(
        onTap: () {
          Application.router.navigateTo(
              context, '/datatail?id=${swiperDateList[index]['goodsId']}');
        },
        child: Image.network(goods['image']),
      ),
    );
  }
}
