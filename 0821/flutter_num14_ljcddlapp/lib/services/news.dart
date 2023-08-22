import 'package:http/http.dart' as http;
import 'dart:convert';
import '../conf/configure.dart';

//获取产品数据
getNewsResult() async{

  String url= 'http://' + Config.IP+':'+Config.PORT+'/?action=getNews';

  var res = await http.get(Uri.parse(url));
  String body = res.body;

  var json=jsonDecode(body);
  print(json);

  return json['items'] as List;
}
