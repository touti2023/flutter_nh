import 'package:flutter/material.dart';
import '../model/post.dart';
import '../demo/post_show.dart';

class ListViewDemo extends StatelessWidget {
  Widget _ListItemBuilder(BuildContext context, int index) {
    return Container(
        color: Colors.white,
        margin: EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Column(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    posts[index].imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  posts[index].title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  posts[index].author,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(
                  height: 16.0,
                ),
              ],
            ),
            Positioned.fill(
                child: Material(
              color: Colors.transparent,
              child:
                  //渐墨动画效果
                  InkWell(
                splashColor: Colors.white.withOpacity(0.3),
                highlightColor: Colors.white.withOpacity(0.1),
                onTap: () {
                  //在内容详情页上显示内容
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PostShow(post: posts[index])));
                },
              ),
            ))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: _ListItemBuilder, itemCount: posts.length);
  }
}
