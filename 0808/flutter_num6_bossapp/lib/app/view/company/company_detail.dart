import 'package:flutter/material.dart';
import '../../model/company.dart';
import 'company_hot_job.dart';
import 'company_inc.dart';
import '../../component/indicator_viewpager.dart';
import 'company_info.dart';

double _kAppBarHeight = 256;

class CompanyDetail extends StatefulWidget {
  final Company _company;
  const CompanyDetail(this._company);

  @override
  State<CompanyDetail> createState() => _CompanyDetailState();
}

class _CompanyDetailState extends State<CompanyDetail>
    with TickerProviderStateMixin {
  late List<Tab> _tabs;
  late TabController _controller;
  late Widget _companyTabContent;
  late VoidCallback onChanged;
  int _currentIndex = 0;

  late List<Widget> _imagePages;
  List<String> _urls = [
    'https://n.sinaimg.cn/sinacn10106/600/w1920h1080/20190622/50e5-hyrtarx2278442.jpg',
    'https://img0.baidu.com/it/u=3006657043,1570230395&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500',
    'https://img2.baidu.com/it/u=3341607878,555245128&fm=253&fmt=auto&app=120&f=JPEG?w=1422&h=800'
  ];

  @override
  void initState() {
    super.initState();

    if (!_urls.isEmpty) {
      _imagePages = <Widget>[];
      _urls.forEach((String url) {
        _imagePages.add(Container(
          color: Colors.black.withAlpha(900),
          child: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Image.network(
              url,
              fit: BoxFit.cover,
              height: _kAppBarHeight,
            ),
          ),
        ));
      });

      _tabs = [
        Tab(
          text: '公司概况',
        ),
        Tab(
          text: '热招职位',
        ),
      ];

      _companyTabContent = CompanyInc(widget._company.inc);
      _controller = TabController(length: _tabs.length, vsync: this);
      onChanged() {
        setState(() {
          if (_currentIndex == 0) {
            _companyTabContent = CompanyInc(widget._company.inc);
          } else {
            _companyTabContent = CompanyHotJob();
          }

          _currentIndex = this._controller.index;
        });
      }
    }
    _controller.addListener(onChanged);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 245),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox.fromSize(
                  size: Size.fromHeight(_kAppBarHeight),
                  child: CarouselDemo(),
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      CompanyInfo(company: widget._company),
                      Divider(),
                      TabBar(
                          indicatorWeight: 3,
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelStyle: TextStyle(fontSize: 16),
                          labelColor: Colors.black,
                          controller: _controller,
                          tabs: _tabs,
                          indicatorColor: Theme.of(context).primaryColor),
                    ],
                  ),
                ),
                _companyTabContent
              ],
            ),
          ),
          Positioned(
              top: 10,
              left: -10,
              child: Container(
                padding: EdgeInsets.all(15),
                child: BackButton(
                  color: Colors.white,
                ),
              ))
        ],
      ),
    );
  }
}
