import 'package:flutter/material.dart';
import '../model/post.dart';

class PostShow extends StatelessWidget {
  final Post post;

  PostShow({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${post.title}'),
          elevation: 0.0,
        ),
        body: Column(
          children: [
            Image.network(post.imageUrl),
            Container(
              padding: EdgeInsets.all(32.0),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${post.title}',
                      style: Theme.of(context).textTheme.titleLarge),
                  Text('${post.author}',
                      style: Theme.of(context).textTheme.headlineSmall),
                  SizedBox(height: 32.0),
                  Text('${post.description}',
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            )
          ],
        ));
  }
}
