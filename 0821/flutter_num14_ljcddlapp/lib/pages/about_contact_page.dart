import 'package:flutter/material.dart';
import '../services/contact.dart';

class AboutContactPage extends StatefulWidget {
  const AboutContactPage({super.key});

  @override
  State<AboutContactPage> createState() => _AboutContactPageState();
}

class _AboutContactPageState extends State<AboutContactPage> {

  TextEditingController controller= TextEditingController();
  
  void commit(){
    if(controller.text.length==0){
      showDialog(context: context, builder: (context)=>AlertDialog(
        title: Text('请输入内容'),
      ));
    } else{
      var info = contactCompany(controller.text);
      print(info);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('给我留言'),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network('https://img2.baidu.com/it/u=1751896436,3800919441&fm=253&fmt=auto&app=138&f=JPEG?w=768&h=417',
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 380
              ,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: '请留言',
                  labelText: '请留言',
                  border: OutlineInputBorder(),//外框
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 220,
              height: 48,
              child: ElevatedButton(
                  onPressed: (){
                    commit();
                  },
                  child: Text('提交',style: TextStyle(
                    fontSize: 16,color: Colors.white,

                  ),
                  )),
            ),
          ],
        ),
      ),
    );;
  }
}
