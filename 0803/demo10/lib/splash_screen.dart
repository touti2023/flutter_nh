import 'package:flutter/material.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  // ignore: non_constant_identifier_names
  late AnimationController _AnimationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _AnimationController = AnimationController(
        duration: Duration(milliseconds: 3000), vsync: this);

    _animation = Tween(begin: 0.0, end: 1.0).animate(_AnimationController);

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomePage()),
            // ignore: unnecessary_null_comparison
            (route) => route == null);
      }
    });
    //播放动画
    _AnimationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _AnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Image.network(
        'https://bpic.wotucdn.com/25/90/64/25906406-9460c43589193e4dd3e93d231006a1e3.jpg%21/fw/1024/quality/91/unsharp/true/compress/true/watermark/url/bG9nby53YXRlci52OC5wbmc=/repeat/true/align/center/format/jpg',
        scale: 2.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
