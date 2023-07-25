import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  const AnimationDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimationDemo'),
        elevation: 0.0,
      ),
      body: AnimationDemoHome(),
    );
  }
}

class AnimationDemoHome extends StatefulWidget {
  const AnimationDemoHome({Key? key}) : super(key: key);

  @override
  _AnimationDemoHomeState createState() => _AnimationDemoHomeState();
}

class _AnimationDemoHomeState extends State<AnimationDemoHome>
    with TickerProviderStateMixin {
  late AnimationController animationDemoController;
  late Animation animation;
  late Animation animationColor;
  //非匀速动画，曲线的
  late CurvedAnimation curve;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationDemoController = AnimationController(
        // value: 32.0,
        // lowerBound: 32.0,
        // upperBound: 100.0,
        duration: Duration(milliseconds: 400),
        vsync: this);

    curve = CurvedAnimation(
        parent: animationDemoController, curve: Curves.bounceOut);

    animation = Tween(begin: 32.0, end: 100.0).animate(curve);
    animationColor =
        ColorTween(begin: Colors.red, end: Colors.green).animate(curve);

    // animationDemoController.addListener(() {
    //   //print('${animationDemoController.value}');
    //   setState(() {});
    // });

    animationDemoController.addStatusListener((status) {
      print(status);
    });

    // animationDemoController.forward();
  }

  @override
  void dispose() {
    super.dispose();

    animationDemoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedHeart(
        animations: [animation, animationColor],
        controller: animationDemoController,
      ),
    );
  }
}

class AnimatedHeart extends AnimatedWidget {
  final List animations;
  final AnimationController controller;

  AnimatedHeart({required this.animations, required this.controller})
      : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.favorite),
      iconSize: animations[0].value,
      color: animations[1].value,
      onPressed: () {
        switch (controller.status) {
          case AnimationStatus.completed:
            controller.reverse();

            break;
          default:
            controller.forward();
        }
        ;
      },
    );
  }
}
