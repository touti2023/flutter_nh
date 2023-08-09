import 'dart:convert';

//数据模型
class Company {
  final String logo;
  final String name;
  final String location; //公司位置
  final String type; //公司性质
  final String size; //公司规模
  final String employee;
  final String hot; //热招职位
  final String count; //职位总数
  final String inc; //公司详情

  Company({
    required this.logo,
    required this.name,
    required this.location,
    required this.type,
    required this.size,
    required this.employee,
    required this.hot,
    required this.count,
    required this.inc,
  });

  //数据转换

  static List<Company> fromJson(String jsonStr) {
    List<Company> _coms = [];

    var mapData = json.decode(jsonStr)['list'];

    for (var com in mapData) {
      _coms.add(Company(
        logo: com['logo'],
        name: com['name'],
        location: com['location'],
        type: com['type'],
        size: com['size'],
        employee: com['employee'],
        hot: com['hot'],
        count: com['count'],
        inc: com['inc'],
      ));
    }
    return _coms;
  }
}
