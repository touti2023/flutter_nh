import 'package:flutter/material.dart';
import 'package:flutter_num7_ggfy/pages/drawer_page.dart';
import 'package:flutter_num7_ggfy/pages/recording_translate_page.dart';
import 'package:flutter_num7_ggfy/pages/textfield_page.dart';
import 'body_page.dart';

class IndexBody extends StatelessWidget {
  const IndexBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Google Translate'),
        ),
        body: Column(
          children: [
            IndexPage(),
            TextFieldDemo(),
            Container(
              height: 10,
            ),
            RecordingTranslate(),
          ],
        ),
        drawer: DrawerPage(),
      ),
    );
  }
}
