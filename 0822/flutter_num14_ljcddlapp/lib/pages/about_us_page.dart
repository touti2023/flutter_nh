import 'package:flutter/material.dart';
import 'about_contact_page.dart';
class AboutUsPage extends StatefulWidget {


  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network('https://img2.baidu.com/it/u=1751896436,3800919441&fm=253&fmt=auto&app=138&f=JPEG?w=768&h=417',
            fit: BoxFit.cover,
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('公司介绍'),
              onTap: (){
                Navigator.of(context).pushReplacementNamed('company_info');
              },
            ),
            Divider(height: 10,),
            //
            ListTile(
              leading: Icon(Icons.info),
              title: Text('公司优势'),

            ),
            Divider(height: 10,),
            //
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('联系我们'),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutContactPage()));
              },
            ),
            Divider(height: 10,),
          ],
        ),
      ),
    );
  }
}
