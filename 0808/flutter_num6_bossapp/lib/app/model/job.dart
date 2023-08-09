import 'dart:convert';

//数据模型
class Job {
  final String name;
  final String cname;
  final String size;
  final String salary;
  final String username;
  final String title;

  Job(
      {required this.name,
      required this.cname,
      required this.size,
      required this.salary,
      required this.username,
      required this.title});

  //数据转换

  static List<Job> fromJson(String jsonStr) {
    List<Job> _jobs = [];

    var mapData = json.decode(jsonStr)['list'];

    for (var obj in mapData) {
      _jobs.add(Job(
        name: obj['name'],
        cname: obj['cname'],
        size: obj['size'],
        salary: obj['salary'],
        username: obj['username'],
        title: obj['title'],
      ));
    }
    return _jobs;
  }
}
