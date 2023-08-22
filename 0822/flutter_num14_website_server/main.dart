import 'dart:convert';
import 'dart:io';
import 'data.dart';

void main(List<String> args) async {
  var requestServer = await HttpServer.bind('127.0.0.1', 8080);

  print('http服务启动起来');

  //处理请求
  await for (HttpRequest request in requestServer) {
    handleMessage(request);
  }
}

void handleMessage(HttpRequest request) {
  try {
    if (request.method == 'GET') {
      handleGET(request);
    } else if (request.method == 'POST') {
      //TODO
    }
  } catch (e) {
    print(e);
  }
}

void handleGET(HttpRequest request) {
  //获取请求参数
  var action = request.uri.queryParameters['action'];

  if (action == 'getProducts') {
    var page = request.uri.queryParameters['page'];

    print('第$page页数据' + json.encode(products));

    print('获取产品数据...');
    request.response
      ..headers
          .set(HttpHeaders.contentTypeHeader, 'application/json; charset=utf-8')
      ..statusCode = HttpStatus.ok
      ..write(json.encode(products))
      ..close();
  } else if (action == 'getNews') {
    print('获取新闻数据');
    request.response
      ..headers
          .set(HttpHeaders.contentTypeHeader, 'application/json; charset=utf-8')
      ..statusCode = HttpStatus.ok
      ..write(json.encode(news))
      ..close();
  } else if (action == 'contactCompany') {
    var msg = request.uri.queryParameters['msg'];

    print('客户留言为:$msg');
    request.response
      ..headers
          .set(HttpHeaders.contentTypeHeader, 'application/json; charset=utf-8')
      ..statusCode = HttpStatus.ok
      ..write('提交成功:$msg')
      ..close();
  }
}

void handlePOST(HttpRequest request) {
  //
}
