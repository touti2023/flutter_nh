import 'package:http/http.dart' as http;
import 'dart:convert';
import '../conf/configure.dart';

//获取产品数据
getProductResult([int page = 0]) async{

  String url= 'http://' + Config.IP+':'+Config.PORT+'/?action=getProducts&page=$page';

  var res = await http.get(Uri.parse(url));
  String body = res.body;

  var json=jsonDecode(body);
  print(json);

  return json['items'] as List;
}
