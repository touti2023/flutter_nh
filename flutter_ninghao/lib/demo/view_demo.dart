import 'package:flutter/material.dart';
import '../model/post.dart';

class ViewDemo extends StatelessWidget {
  const ViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return GridViewBuilderDemo();
  }
}

class GridViewBuilderDemo extends StatelessWidget {
  Widget _gridItemBuilder(BuildContext context, int index) {
    return Container(
      child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: posts.length,
      itemBuilder: _gridItemBuilder,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0),
    );
  }
}

class GridViewExtentDemo extends StatelessWidget {
  List<Widget> _buildTiles(int length) {
    return List.generate(
      length,
      (index) => Container(
        color: Colors.grey[300],
        alignment: Alignment(0.0, 0.0),
        child: Text('Item ${index + 1}',
            style: TextStyle(fontSize: 18.0, color: Colors.grey)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 150.0,
      crossAxisSpacing: 5.0,
      mainAxisSpacing: 5.0,
      children: _buildTiles(100),
    );
  }
}

class GridViewCountDemo extends StatelessWidget {
  List<Widget> _buildTiles(int length) {
    return List.generate(
      length,
      (index) => Container(
        color: Colors.grey[300],
        alignment: Alignment(0.0, 0.0),
        child: Text('Item ${index + 1}',
            style: TextStyle(fontSize: 18.0, color: Colors.grey)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 5.0,
      mainAxisSpacing: 5.0,
      children: _buildTiles(100),
    );
  }
}

class PageViewBuilderDemo extends StatelessWidget {
  Widget _pageItemBuilder(BuildContext context, int index) {
    return Stack(
      children: [
        //填满空间
        SizedBox.expand(
          child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                posts[index].title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(posts[index].author),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: posts.length,
      itemBuilder: _pageItemBuilder,
    );
  }
}

class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      //页面自动滚动//不会自动翻页
      //pageSnapping: false,
      //反向页面123 -> 321
      //reverse: true,
      //页面水平/垂直滚动。默认水平，垂直:Axis.vertical
      scrollDirection: Axis.vertical,
      onPageChanged: (currentPage) => debugPrint('Page:$currentPage'),
      controller: PageController(
          //表示默认初始页面索引
          initialPage: 1,
          //记录上次到哪页
          keepPage: false,
          //缩放比例，默认是1=占满屏幕100%
          viewportFraction: 1),
      children: [
        Container(
          color: Colors.amber[900],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            "One",
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        Container(
          color: Color.fromARGB(255, 135, 223, 234),
          alignment: Alignment(0.0, 0.0),
          child: Text(
            "two",
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        Container(
          color: Color.fromARGB(255, 178, 12, 244),
          alignment: Alignment(0.0, 0.0),
          child: Text(
            "three",
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
      ],
    );
    ;
  }
}
