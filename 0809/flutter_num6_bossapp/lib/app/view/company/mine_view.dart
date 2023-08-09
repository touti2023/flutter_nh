import 'package:flutter/material.dart';

class MineTab extends StatelessWidget {
  const MineTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 245),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color.fromARGB(255, 0, 215, 198),
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment(0, -1),
                          end: Alignment(0, -0.4),
                          colors: [Color(0x00000000), Color(0x00000000)]),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 30, right: 20),
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(
                              'https://img0.baidu.com/it/u=1655080209,2757925451&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500'),
                        ),
                      ),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 10, right: 10),
                                child: Text(
                                  '多拉噩梦',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                              Text(
                                '在职-考虑机会',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _ContactItem(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Text(
                                  '沟通过',
                                  style: TextStyle(fontSize: 20),
                                ),
                              );
                            });
                      },
                      count: '590',
                      title: '沟通过',
                    ),
                    _ContactItem(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Text(
                                  '已沟通',
                                  style: TextStyle(fontSize: 20),
                                ),
                              );
                            });
                      },
                      count: '711',
                      title: '已沟通',
                    ),
                    _ContactItem(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Text(
                                  '待面试',
                                  style: TextStyle(fontSize: 20),
                                ),
                              );
                            });
                      },
                      count: '0',
                      title: '待面试',
                    ),
                  ],
                ),
              ),
            ),
          ]))
        ],
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final String count;
  final String title;
  final VoidCallback onPressed;
  const _ContactItem(
      {super.key,
      required this.count,
      required this.title,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: 10,
            ),
            child: Text(
              count,
              style: TextStyle(fontSize: 22),
            ),
          ),
          Text(title),
        ],
      ),
    );
  }
}
