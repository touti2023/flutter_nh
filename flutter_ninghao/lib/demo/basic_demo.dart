import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {
  const BasicDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.grey[100],
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://primaradio.co.id/wp-content/uploads/2023/07/detective-conan-1.jpg"),
              alignment: Alignment.topCenter,
              fit: BoxFit.cover,
              //颜色滤镜
              colorFilter: ColorFilter.mode(
                  //颜色与不透明度
                  Colors.indigoAccent[400]!.withOpacity(0.5),
                  //背景图片与背景颜色混合模式
                  BlendMode.hardLight))),
      //背景图像

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Icon(Icons.pool, size: 32.0, color: Colors.white),
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(8.0),
            width: 90.0,
            height: 90.0,
            decoration: BoxDecoration(
                color: Color.fromRGBO(3, 54, 255, 1.0),
                //边框属性
                border: Border.all(
                  color: Colors.white,
                  width: 3.0,
                  style: BorderStyle.solid,
                ),
                //圆角属性
                //borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0.0, 16.0),
                      color: Color.fromRGBO(16, 20, 188, 1.0),
                      blurRadius: 25.0,
                      spreadRadius: -9.0)
                ],
                //改变形状
                shape: BoxShape.circle,
                //镜像渐变
                // gradient: RadialGradient(
                //   colors: [
                //     Color.fromRGBO(7, 102, 255, 1.0),
                //     Color.fromRGBO(3, 28, 128, 1.0),
                //   ],
                // ),
                //线性渐变
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(7, 102, 255, 1.0),
                    Color.fromRGBO(3, 28, 128, 1.0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
          )
        ],
      ),
    );
  }
}

class RichDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: 'ninghao',
            style: TextStyle(
              color: Colors.deepPurpleAccent,
              fontSize: 34.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w100,
            ),
            children: [
          TextSpan(
              text: '.net',
              style: TextStyle(
                fontSize: 17.0,
                color: Colors.grey,
              ))
        ]));
  }
}

class TextDemo extends StatelessWidget {
  final TextStyle _textStyle = TextStyle(
    fontSize: 16.0,
  );

  final String _author = '白居易';
  final String _title = '琵琶行';

  @override
  Widget build(BuildContext context) {
    return Text(
      "どうか断らないでほしい、もう一度座ってあと一曲の願いを。私もあなたのために琵琶の音色を詩に変えて『琵琶行（びわうた）』を書いて進ぜよう。琵琶女は私のこの言葉に感じてしばらく立っていたが座って絃を絞るとにわかに急な調子が流れ音色のうら悲しさは先ほどとは様変わり。満座の者これを聞いてみな涙に濡れた顔を覆う。座中最も涙を流したのは誰か。それはこの私、江州の司馬だ。わが青衣はすっかり涙で濡れてしまった。",
      textAlign: TextAlign.left,
      style: _textStyle,
      //最大行数
      maxLines: 3,
      //装不下的会省略掉
      overflow: TextOverflow.ellipsis,
    );
  }
}
