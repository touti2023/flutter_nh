import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        title: Text('微信'),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).pushReplacementNamed('search');
            },
            child: Icon(Icons.search),
          ),
          Padding(padding: EdgeInsets.only(left: 30,right: 20),child: GestureDetector(
            onTap: (){
              showMenu(context: context, 
                  position: RelativeRect.fromLTRB(500, 76, 10, 0), 
                  items: <PopupMenuEntry>[
                    _popupMenuItem('发起群聊'),
                    _popupMenuItem('添加朋友'),
                    _popupMenuItem('扫一扫'),
                    _popupMenuItem('收付款'),
                    _popupMenuItem('帮助与反馈'),

                  ]);
            },
            child: Icon(Icons.add),
          ),)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.green[200],
        selectedLabelStyle: TextStyle(color: Color(0xFF46c01b),fontSize: 18),
        unselectedLabelStyle: TextStyle(color: Color(0xff999999),fontSize: 18),
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: ((index){
        setState(() {
          _currentIndex=index;
        });
      }),
        items: [
          BottomNavigationBarItem(
              label: '微信',
              icon: Icon(Icons.chat)),
          BottomNavigationBarItem(
              label: '通讯录',
              icon: Icon(Icons.contacts)),
          BottomNavigationBarItem(
              label: '发现',
              icon: Icon(Icons.find_in_page)),
          BottomNavigationBarItem(
              label: '我的',
              icon: Icon(Icons.people)),

      ],

      ),
      body: Center(
        child: Text('hello  world'),
      ),
    );
  }

  _popupMenuItem(String title) {
    IconData? icon;

    switch (title) {
      case '发起群聊':
        icon = Icons.group;
        break;
      case '添加朋友':
        icon = Icons.person_add;
        break;
      case '扫一扫':
        icon = Icons.qr_code_scanner;
        break;
      case '收付款':
        icon = Icons.crop_free;
        break;
      case '帮助与反馈':
        icon = Icons.email;
        break;
      default:
        icon = Icons.help_outline;
        break;
    }

    return PopupMenuItem(
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 40),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Text(title, style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }


}
