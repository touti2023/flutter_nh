import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  dioDemo() async{
   try{
     Dio dio= Dio();
     var response = await dio.get('https://flutter.dev',options: Options(headers: {'user-agent':'Custom-UA'}));
     print(response.data.toString());
   }catch(e){
     print(e);
   }
 }

  dioInterceptorReject() async{
    Dio dio = Dio();
    dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options,RequestInterceptorHandler handler)
    {
      return handler.reject(DioException(requestOptions: options,error: 'Error:拦截的原因',type: DioExceptionType.cancel),);
    }
    ));
  }

  String jsonString = '''
  {
  "id": "123",
  "name": "张三",
  "score": 95,
  "teacher":
  {
 "name": "李四",
    "age": 40
  }
  }
  ''';

  static Student parseStudent(String content){
    final jsonResponse=json.decode(content);
    Student student = Student.fromJson(jsonResponse);
    return student;
  }

  Future<Student> loadStudent(){
    return compute( parseStudent, jsonString);
  }

  jsonParseDemo(){
    loadStudent().then((s) {
      String content='''
      name:${s.name}
      score:${s.score}
      teacher:${s.teacher.name}
      ''';
      print(content);
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: ()=>dioDemo(), child: Text('Dio demo'),),
            ElevatedButton(onPressed: ()=>dioInterceptorReject(), child: Text('Dio 拦截'),),
            ElevatedButton(onPressed: ()=>jsonParseDemo(), child: Text('JSON解析demo'),),

          ],
        ),
      ),
    );
  }

}


class Student{
  String id;
  String name;
  int score;
  Teacher teacher;

  Student({required this.id,required this.name,required this.score,required this.teacher});
  factory Student.fromJson(Map<String,dynamic> parsedJson){
    return Student(
      id:parsedJson['id'],
      name:parsedJson['name'],
      score:parsedJson['score'],
      teacher:Teacher.fromJson(parsedJson['teacher']),
    );
  }
}

class Teacher {
  String name;
  int age;
  Teacher ({required this.name,required this.age});

  factory Teacher.fromJson(Map<String,dynamic> parsedJson){
    return Teacher(
        name: parsedJson['name'],
        age: parsedJson['age']);
  }
}