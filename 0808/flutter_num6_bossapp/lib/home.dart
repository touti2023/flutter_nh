import 'package:flutter/material.dart';
import 'app/component/icon_tab.dart';
import 'app/view/company/mine_view.dart';
import 'app/view/jobs_view.dart';
import 'app/view/message_view.dart';
import './app/view/company_view.dart';

class BossApp extends StatefulWidget {
  @override
  State<BossApp> createState() => _BossAppState();
}

class _BossAppState extends State<BossApp> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late TabController _controller;
  late VoidCallback onChanged;
  double _kTabTextSize = 11;
  int INDEX_JOB = 0;
  int INDEX_COMPANY = 1;
  int INDEX_MESSAGE = 2;
  int INDEX_MINE = 3;
  Color _kPrimaryColor = Color.fromARGB(255, 0, 215, 198);

  @override
  void initState() {
    _controller =
        TabController(initialIndex: _currentIndex, length: 4, vsync: this);
    super.initState();
    onChanged = () {
      setState(() {
        _currentIndex = this._controller.index;
      });
    };

    _controller.addListener(onChanged);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: [
          JobsTab(),
          CompanyTab(),
          MessageTab(),
          MineTab(),
        ],
        controller: _controller,
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
            controller: _controller,
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: TextStyle(fontSize: _kTabTextSize),
            tabs: <IconTab>[
              IconTab(
                iconUrl: _currentIndex == INDEX_JOB
                    ? 'https://img0.baidu.com/it/u=2594156704,713551222&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=501'
                    : 'https://img2.baidu.com/it/u=3814019687,1633842913&fm=253&fmt=auto&app=138&f=PNG?w=373&h=324',
                text: '职位',
                color:
                    _currentIndex == INDEX_JOB ? _kPrimaryColor : Colors.grey,
              ),
              IconTab(
                iconUrl: _currentIndex == INDEX_COMPANY
                    ? 'https://img1.baidu.com/it/u=494797095,617835148&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500'
                    : 'https://img1.baidu.com/it/u=2891851844,2857707514&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',
                text: '职位',
                color: _currentIndex == INDEX_COMPANY
                    ? _kPrimaryColor
                    : Colors.grey,
              ),
              IconTab(
                iconUrl: _currentIndex == INDEX_MESSAGE
                    ? 'https://img2.baidu.com/it/u=1994589608,3829225624&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500'
                    : 'https://img1.baidu.com/it/u=494797095,617835148&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500',
                text: '职位',
                color: _currentIndex == INDEX_MESSAGE
                    ? _kPrimaryColor
                    : Colors.grey,
              ),
              IconTab(
                iconUrl: _currentIndex == INDEX_MINE
                    ? 'https://img2.baidu.com/it/u=3857670393,263249145&fm=253&fmt=auto&app=138&f=JPEG?w=508&h=500'
                    : 'https://img1.baidu.com/it/u=378816023,621499183&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=500',
                text: '职位',
                color:
                    _currentIndex == INDEX_MINE ? _kPrimaryColor : Colors.grey,
              ),
            ]),
      ),
    );
  }
}
