import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //裁切
          ClipPath(
            clipper: BottomClipperTest(),
            child: Container(
              color: Colors.deepPurpleAccent,
              height: 200.0,
            ),
          ),
        ],
      ),
    );
  }
}

//单曲线
// class BottomClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(0.0, 0.0);
//     path.lineTo(0.0, size.height - 60);
//     var firstControlPoint = Offset(size.width / 2, size.height);
//     var firstEndPoint = Offset(size.width, size.height - 60);
//     //贝塞尔曲线
//     path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
//         firstEndPoint.dx, firstEndPoint.dy);
//     path.lineTo(size.width, size.height - 60);
//     path.lineTo(size.width, 0);

//     return path;
//   }

//   //没啥鸟用
//   @override
//   bool shouldReclip(covariant CustomClipper oldClipper) {
//     return false;
//   }
// }

//波浪曲线
class BottomClipperTest extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, 0.0);
    path.lineTo(0.0, size.height - 40);
    var fcPoint = Offset(size.width / 4, size.height);
    var fePoint = Offset(size.width / 2.25, size.height - 30);

    path.quadraticBezierTo(fcPoint.dx, fcPoint.dy, fePoint.dx, fePoint.dy);

    var scPoint = Offset(size.width / 4 * 3, size.height - 90);
    var sePoint = Offset(size.width, size.height - 60);

    path.quadraticBezierTo(scPoint.dx, scPoint.dy, sePoint.dx, sePoint.dy);

    path.lineTo(size.width, size.height - 60);
    path.lineTo(size.width, 0.0);

    return path;
  }

  //没啥鸟用
  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
