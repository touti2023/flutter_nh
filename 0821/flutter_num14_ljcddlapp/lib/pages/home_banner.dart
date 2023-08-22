import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class BannerWidget extends StatelessWidget {

List<String> banners = <String>[
    'assets/images/banners/1.webp',
    'assets/images/banners/2.webp',
    'assets/images/banners/3.webp',
    'assets/images/banners/4.webp',
];
  @override
  Widget build(BuildContext context) {

    //屏幕宽高
    double width = MediaQuery.of(context).size.width;
    double height= width*540/1080;

    return Container(
      width: width,
      height: height,
      child: Swiper(
          itemCount: banners.length,
      itemBuilder: (context,index){
            return Container(
              child: Image.asset(banners[index],
              width: width,
              height: height,
              fit: BoxFit.cover,),

            );
      },
      scrollDirection: Axis.horizontal,
      autoplay: true,),
    );
  }
}
