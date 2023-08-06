import 'package:dio/dio.dart';
import 'dart:async';
import '../config/service_url.dart';

//获取首页主题内容

Future request(url, {formData}) async {
  try {
    print('开始获取数据......');
    Dio dio = Dio();
    dio.options.headers['Content-Type'] = 'application/x-www-form-urlencoded';

    //区分开是否带参数
    Response response;
    if (formData == null) {
      response = await dio.post(ServicePath[url]!);
    } else {
      response = await dio.post(ServicePath[url]!, data: formData);
    }

    if (response.statusCode == 200) {
      return response.data;
    }
    throw Exception('后端接口出现异常');
  } catch (e) {
    return print('ERROR===>$e');
  }
}

Future getHomePageContent() async {
  try {
    print('开始获取首页数据......');
    Dio dio = Dio();
    dio.options.headers['Content-Type'] = 'application/x-www-form-urlencoded';

    var formData = {'lon': '115.02932', 'lat': '35.76189'};
    Response response;
    response = await dio.post(ServicePath['homePageContent']!, data: formData);
    if (response.statusCode == 200) {
      return response.data;
    }
    throw Exception('后端接口出现异常');
  } catch (e) {
    return print('ERROR===>$e');
  }
}

//获得火爆专区的商品方法
Future getHomePageBelowConten() async {
  try {
    print('开始获取火爆专区数据......');
    Dio dio = Dio();
    dio.options.headers['Content-Type'] = 'application/x-www-form-urlencoded';

    int page = 1;
    Response response;
    response = await dio.post(ServicePath['homePageBelowConten']!, data: page);
    if (response.statusCode == 200) {
      return response.data;
    }
    throw Exception('后端接口出现异常');
  } catch (e) {
    return print('ERROR===>$e');
  }
}
