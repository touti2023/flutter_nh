import 'package:flutter/material.dart';
import 'dart:ui';

class FrostedGlassDemo extends StatelessWidget {
  const FrostedGlassDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //约束盒子，添加额外的约束条件
          ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Image.network(
                'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2Ff60772b3-e179-445d-8ac8-91eb5265d617%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1693572593&t=1dd15ab92470506d31e500112a69bad9'),
          ),
          Center(
            child:
                //可裁切的矩形
                ClipRect(
              child:
                  //背景过滤器
                  BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child:
                    //透明度
                    Opacity(
                  opacity: 0.5,
                  child: Container(
                    width: 500.0,
                    height: 700.0,
                    decoration: BoxDecoration(color: Colors.grey.shade200),
                    //再加一个文字层
                    child: Center(
                      child: Text(
                        'JSPang',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
