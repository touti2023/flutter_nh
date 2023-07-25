import 'package:flutter/material.dart';
import '../model/post.dart';

class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            //title: Text("おはようニュース"),
            //保持顶部不滚动，默认滚动
            //pinned: true,
            //滚动逐渐显示顶部
            backgroundColor: Colors.lime,
            floating: true,
            //带渐进动画的可伸缩顶部
            expandedHeight: 178.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "蒟蒻が美味しい".toUpperCase(),
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.pink,
                  letterSpacing: 5.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              background: Image.network(
                'https://ih1.redbubble.net/image.2164551038.7638/st,small,507x507-pad,600x600,f8f8f8.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          //不被上方黑色遮挡
          SliverSafeArea(
            sliver: SliverPadding(
                padding: EdgeInsets.all(8.0), sliver: SliverListDemo()),
          )
        ],
      ),
    );
  }
}

class SliverListDemo extends StatelessWidget {
  const SliverListDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Padding(
            padding: EdgeInsets.only(bottom: 18.0),
            child: Material(
              borderRadius: BorderRadius.circular(12.0),
              elevation: 14.0,
              shadowColor: Colors.grey.withOpacity(0.5),
              child: Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      posts[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      top: 32.0,
                      left: 32.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            posts[index].title,
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                          ),
                          Text(
                            posts[index].author,
                            style:
                                TextStyle(fontSize: 13.0, color: Colors.white),
                          ),
                        ],
                      ))
                ],
              ),
            ));
      }, childCount: posts.length),
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  const SliverGridDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 1.0),
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
          child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
          ),
        );
      }, childCount: posts.length),
    );
  }
}
