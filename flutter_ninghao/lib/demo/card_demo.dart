import 'package:flutter/material.dart';
import '../model/post.dart';

class CardDemo extends StatefulWidget {
  const CardDemo({Key? key}) : super(key: key);

  @override
  _CardDemoState createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CardDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: posts.map((post) {
            return Card(
              child: Column(
                children: <Widget>[
                  AspectRatio(
                      aspectRatio: 16 / 9,
                      //给图片添加圆角效果
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(6.0),
                          topRight: Radius.circular(6.0),
                          bottomLeft: Radius.circular(6.0),
                          bottomRight: Radius.circular(6.0),
                        ),
                        child: Image.network(
                          post.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      )),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(post.imageUrl),
                    ),
                    title: Text(post.title),
                    subtitle: Text(post.author),
                  ),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      post.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  ButtonTheme(
                      child: ButtonBar(
                    children: [
                      ElevatedButton(
                          onPressed: () {}, child: Text('Like'.toUpperCase())),
                      ElevatedButton(
                          onPressed: () {}, child: Text('Read'.toUpperCase())),
                    ],
                  ))
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
