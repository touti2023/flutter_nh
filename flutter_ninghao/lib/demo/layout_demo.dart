import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      ConstrainedBox(
        child: Container(
          color: Color.fromRGBO(3, 54, 225, 1.0),
        ),
        constraints: BoxConstraints(maxHeight: 200.0, maxWidth: 200.0),
      ),
    ]));
  }
}

class AspectRatio extends StatelessWidget {
  const AspectRatio(
      {super.key, required double aspectRatio, required Container child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //宽高比
          AspectRatio(
            aspectRatio: 16.0 / 9.0,
            child: Container(
              color: Color.fromRGBO(3, 54, 255, 1.0),
            ),
          )
        ],
      ),
    );
  }
}

class StackDemo extends StatelessWidget {
  const StackDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //一堆，堆叠起来
        Stack(
          alignment: Alignment.topLeft,
          children: [
            SizedBox(
              width: 200.0,
              height: 300.0,
              child: Container(
                //更灵活定位部件在容器中的位置
                alignment: Alignment(0.0, -0.9),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(3, 54, 255, 1.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(
              height: 32.0,
            ),
            SizedBox(
              width: 100.0,
              height: 100.0,
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(3, 54, 255, 1.0),
                    //borderRadius: BorderRadius.circular(8.0),
                    //设置成圆形
                    shape: BoxShape.circle,
                    //来点渐变，镜像渐变
                    gradient: RadialGradient(colors: [
                      Color.fromRGBO(7, 102, 255, 1.0),
                      Color.fromRGBO(3, 54, 255, 1.0),
                    ])),
                child: Icon(
                  Icons.brightness_2,
                  color: Colors.white,
                  size: 32.0,
                ),
              ),
            ),
            //设置小雪花位置
            Positioned(
              right: 20.0,
              top: 20.0,
              child: Icon(Icons.ac_unit, color: Colors.white, size: 32.0),
            ),
            Positioned(
              right: 20.0,
              top: 120.0,
              child: Icon(Icons.ac_unit, color: Colors.white, size: 32.0),
            ),
            Positioned(
              right: 70.0,
              top: 180.0,
              child: Icon(Icons.ac_unit, color: Colors.white, size: 32.0),
            ),
            Positioned(
              right: 30.0,
              top: 230.0,
              child: Icon(Icons.ac_unit, color: Colors.white, size: 32.0),
            ),
            Positioned(
              right: 90.0,
              top: 20.0,
              child: Icon(Icons.ac_unit, color: Colors.white, size: 32.0),
            ),
            Positioned(
              right: 4.0,
              top: -4.0,
              child: Icon(Icons.ac_unit, color: Colors.white, size: 32.0),
            ),
          ],
        )
      ],
    );
  }
}

//小徽章部件
class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;

  IconBadge(this.icon, {this.size = 32.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(icon, size: size, color: Colors.white),
      width: size + 60,
      height: size + 60,
      color: Color.fromRGBO(3, 54, 255, 1.0),
    );
  }
}
