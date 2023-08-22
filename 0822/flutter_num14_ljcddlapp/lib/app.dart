import 'package:flutter/material.dart';
import './pages/about_us_page.dart';
import './pages/home_page.dart';
import './pages/news_page.dart';
import './pages/product_page.dart';

class App extends StatefulWidget {

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  var _currentIndex=0;

  Homepage homepage = Homepage();
  ProductPage productPage = ProductPage();
  NewsPage newsPage = NewsPage();
  AboutUsPage aboutUsPage = AboutUsPage();

  currentPage(){
    switch(_currentIndex){
      case 0:
        if(homepage ==null){
        homepage=Homepage();
      }
        return homepage;

      case 1:
        if(productPage ==null){
          productPage=ProductPage();
        }
        return productPage;

      case 2:
        if(newsPage ==null){
          newsPage=NewsPage();
        }
        return newsPage;

      case 3:
        if(aboutUsPage ==null){
          aboutUsPage=AboutUsPage();
        }
        return aboutUsPage;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter'),
        leading: Icon(Icons.home),
        actions: [
          Padding(padding: EdgeInsets.only(right: 20),child: 
            GestureDetector(
              onTap: (){
                
              },
              child: Icon(Icons.search),
            ),
          ),
        ],
      ),
      //
      body: currentPage(),
      //
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: ((index){
          setState(() {
            _currentIndex=index;
          });
        }),
        //
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.apps),
            label: '产品',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.fiber_new),
            label: '新闻',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.insert_comment),
            label: '关于我们',
          ),
        ],
      ),

    );
  }
}
