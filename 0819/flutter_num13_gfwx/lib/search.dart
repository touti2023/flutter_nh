import 'package:flutter/material.dart';
import './common/touch_callback.dart';

class Search extends StatefulWidget {


  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  FocusNode focusNode = FocusNode();

  _requestFocus(){
    FocusScope.of(context).requestFocus(focusNode);
    return focusNode;
  }


  _getText(String text){
    return TouchCallBack(
      isfeed: true,
        child: Text(text,style: TextStyle(fontSize: 14,color: Color(0xff1aad19)),),
        onPressed: (){},);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [

                TouchCallBack(
                    isfeed: false,
                    child: Container(
                      height: 45,
                        margin: EdgeInsets.only(left: 12,right: 10),
                      child: Icon(Icons.chevron_left,color: Colors.black,),
                    ),
                    onPressed: (){
                      Navigator.pop(context);
                    }),



                Container(
                  alignment: Alignment.centerLeft,
                  height: 45,
                  margin: EdgeInsets.only(left: 50,right: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Colors.green
                      ),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: TextField(
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16
                        ),
                        onChanged: (String text){

                        },
                        decoration: InputDecoration(
                          hintText: '搜索',
                          border: InputBorder.none
                        ),
                      )),
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Icon(Icons.mic,
                            color: Color(0xffaaaaaa),),

                          ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Text('搜索指定文章',
              style: TextStyle(
                fontSize: 16,color: Color(0xfffb5b5b5)
              ),),
            ),
            Padding(padding: EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _getText('朋友圈'),
                _getText('文章'),
                _getText('公众号'),

              ],
            ),),
            Padding(padding: EdgeInsets.only(left: 30,right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _getText('小程序'),
                  _getText('音乐'),
                  _getText('表情'),

                ],
              ),),
          ],
        ),
      ),
    );
  }
}

