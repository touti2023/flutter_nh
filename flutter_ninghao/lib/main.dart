import 'package:flutter/material.dart';
import 'package:ninghao_13kara/demo/chip_demo.dart';
import 'package:ninghao_13kara/demo/form_demo.dart';
import 'demo/animation/animation_demo.dart';
import 'demo/bloc/bloc_demo.dart';
import 'demo/http/http_demo.dart';
import 'demo/i18n/i18n_demo.dart';
import 'demo/rxdart/rxdart_demo.dart';
import 'demo/stream/stream_demo.dart';
import 'demo/test_demo.dart';
import 'model/post.dart';
import 'demo/listView_demo.dart';
import './demo/drawer_demo.dart';
import './demo/bottom_navigation_bar_demo.dart';
import 'demo/listView_demo.dart';
import './demo/basic_demo.dart';
import './demo/layout_demo.dart';
import './demo/view_demo.dart';
import './demo/sliver_demo.dart';
import './demo/navigator_demo.dart';
import './demo/form_demo.dart';
import './demo/material_components.dart';
import './demo/radio_demo.dart';
import './demo/switch_demo.dart';
import './demo/slider_demo.dart';
import './demo/datetime_demo.dart';
import './demo/SimpleDialogDemo.dart';
import './demo/alert_dialog_demo.dart';
import './demo/bottom_sheet_demo.dart';
import './demo/Snack_bar_demo.dart';
import './demo/expansion_panel_demo.dart';
import './demo/chip_demo.dart';
import 'demo/data_table_demo.dart';
import './demo/paginated_data_table_demo.dart';
import './demo/card_demo.dart';
import './demo/stepper_demo.dart';
import './demo/state/state_management_demo.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ninghao_13kara/demo/i18n/map/ninghao_demo_localization.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // localeListResolutionCallback: (locales, supportedLocales) {
      //   return Locale('en', 'US');
      // },
      locale: Locale('zh', 'CN'),

      localizationsDelegates: [
        NinghaoDemolocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'),
        Locale('zh', 'CN'),
      ],
      debugShowCheckedModeBanner: false,
      //home: NavigatorDemo(),

      //初始化默认路由页面
      initialRoute: '/test',
      //命名路由 map类型
      routes: {
        //初始路由指定默认页面,此时需要注销Home:组件。
        '/': (context) => Home(), //NavigatorDemo(),
        '/about': (context) => Pages(title: 'About'),
        '/form': (context) => FormDemo(),
        '/mdc': (context) => MaterialComponents(),
        '/radio': (context) => RadioDemo(),
        '/switch': (context) => SwitchDemo(),
        '/slider': (context) => SliderDemo(),
        '/datetime': (context) => DateTimeDemo(),
        '/simpledialog': (context) => SimpleDialogDemo(),
        '/alertdialog': (context) => AlertDialogDemo(),
        '/bottomsheet': (context) => BottomSheetDemo(),
        '/snackbar': (context) => SnackBarDemo(),
        '/expanison': (context) => ExpansionPanelDemo(),
        '/chip': (context) => ChipDemo(),
        '/datatable': (context) => DataTableDemo(),
        '/paginateddatatable': (context) => PaginatedDataTableDemo(),
        '/card': (context) => CardDemo(),
        '/stepper': (context) => StepperDemo(),
        '/stateManagement': (context) => StateManagementDemo(),
        '/stream': (context) => StreamDemo(),
        '/rxdart': (context) => RxdartDemo(),
        '/bloc': (context) => BlocDemo(),
        '/http': (context) => HttpDemo(),
        '/animation': (context) => AnimationDemo(),
        '/i18n': (context) => I18nDemo(),
        '/test': (context) => TestDemo(),
      },
      //上屏幕背景色
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //高亮选取范围颜色
        highlightColor: Colors.blue,
        //选中目标水波纹颜色
        splashColor: Colors.white70,
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text("Ning Hao"),
          actions: [
            IconButton(
                onPressed: (() => debugPrint('search button is pressed.')),
                icon: Icon(Icons.search),
                tooltip: 'Navigation'),
          ],
          elevation: 2.0,
          bottom: const TabBar(
              //未被选中的颜色
              unselectedLabelColor: Colors.black38,
              //选中光标下划线颜色
              indicatorColor: Colors.black54,
              //选中光标下划线对其标签图标
              indicatorSize: TabBarIndicatorSize.label,
              //选中光标下划线粗细
              indicatorWeight: 2.0,
              tabs: [
                Tab(icon: Icon(Icons.local_florist)),
                Tab(icon: Icon(Icons.change_history)),
                Tab(icon: Icon(Icons.directions_bike_outlined)),
                Tab(icon: Icon(Icons.view_quilt)),
              ]),
        ),
        body:
            //下方内容标签链表
            TabBarView(
          children: [
            ListViewDemo(),
            BasicDemo(),
            //Icon(Icons.directions_bike, size: 128.0, color: Colors.black12),
            LayoutDemo(),
            //ViewDemo(),
            SliverDemo(),
          ],
        ),

        drawer: DrawerDemo(),
        //底层导航栏
        bottomNavigationBar: BottomNavigationBarDemo(),
      ),
    );
  }
}
