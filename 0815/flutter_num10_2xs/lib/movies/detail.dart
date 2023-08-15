import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {

  final String id;
  final String title;
  const MovieDetail({super.key, required this.id, required this.title});

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Text('电影id为:${widget.id}'),
    );
  }
}
