import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _imageUrls = [
    'https://img1.baidu.com/it/u=4178793968,17169106&fm=253&fmt=auto&app=120&f=JPEG?w=1200&h=800',
    'https://img1.baidu.com/it/u=3515774788,2297167557&fm=253&fmt=auto&app=138&f=JPEG?w=1000&h=451',
    'https://img1.baidu.com/it/u=2288082936,3752298383&fm=253&fmt=auto&app=138&f=JPEG?w=771&h=500',
    'https://img0.baidu.com/it/u=4027053907,2565186345&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: const Text('Carousel Slider with Indicators')),
        body: Center(
          child: ListView(
            children: <Widget>[
              Container(
                height: 160,
                child: Swiper(
                  itemCount: _imageUrls.length,
                  autoplay: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Image.network(
                      _imageUrls[index],
                      fit: BoxFit.cover,
                    );
                  },
                  pagination: const SwiperPagination(),
                ),
              ),
              Container(
                height: 800,
                child: ListTile(
                  title: Text('data'),
                ),
              ),
            ],
          ),
        ));
  }
}
