import 'package:flutter/material.dart';
import '../pages/index_page.dart';

class OpenAnimation extends StatefulWidget {
  const OpenAnimation({super.key});

  @override
  State<OpenAnimation> createState() => _OpenAnimationState();
}

class _OpenAnimationState extends State<OpenAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);

    _animation = Tween(begin: 0, end: 1).animate(_controller);

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) {
          return IndexBody();
          // ignore: unnecessary_null_comparison
        }), (route) => route == null);
      }
    });
    super.initState();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FadeTransition(
        opacity: _controller,
        child: Image.network(
          'https://img0.baidu.com/it/u=3686783072,3011810780&fm=253&fmt=auto&app=138&f=JPEG?w=640&h=320',
          width: 650,
          height: 650,
        ),
      ),
    );
  }
}
