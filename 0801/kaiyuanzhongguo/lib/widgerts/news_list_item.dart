import 'package:flutter/material.dart';

import '../Pages/news_detail_page.dart';

class NewsListItem extends StatelessWidget {
  final Map<String, dynamic> newsList;

  NewsListItem({required this.newsList});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NewsDetailPage(
                  id: newsList['id'],
                )));
      },
      child: Container(
        margin: EdgeInsets.only(left: 20.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.blue,
              width: 1.0,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0),
          child: Column(
            children: <Widget>[
              Text(
                '${newsList['title']}',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '@${newsList['author']} ${newsList['pubDate'].toString().split(' ')[0]}',
                    style: TextStyle(color: Color(0xaaaaaaaa), fontSize: 14.0),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.message,
                        color: Color(0xaaaaaaaa),
                      ),
                      Text(
                        '${newsList['commentCount']}',
                        style:
                            TextStyle(color: Color(0xaaaaaaaa), fontSize: 14.0),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
