import 'package:flutter/material.dart';
import '../item/companylist_item.dart';
import '../model/company.dart';
import '../view/company/company_detail.dart';

class CompanyTab extends StatefulWidget {
  @override
  State<CompanyTab> createState() => _CompanyTabState();
}

class _CompanyTabState extends State<CompanyTab> {
  List<Company> _companties = [];

  @override
  void initState() {
    getCompanyList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 242, 242, 245),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 215, 198),
        elevation: 0,
        title: Text(
          '公  司',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: ListView.builder(
          itemCount: _companties.length, itemBuilder: buildCompanyItem),
    );
  }

  Widget buildCompanyItem(BuildContext context, int index) {
    Company conpany = _companties[index];

    var conpanyItem = InkWell(
      onTap: () => nacCompanyDetail(conpany, index),
      child: CompanyListItem(conpany),
    );
    return conpanyItem;
  }

  void getCompanyList() {
    setState(() {
      _companties = Company.fromJson("""
{
  "list":[
    {
      "logo":"https://img1.baidu.com/it/u=234097811,1521344574&fm=253&fmt=auto&app=138&f=JPEG?w=558&h=500",
      "name":"杭州蚂蚁金服",
      "location":"上海市浦东新区",
      "type":"互联网",
      "size":"B轮",
      "employee":"10000人以上",
      "hot":"资深开放产品技术工程师",
      "count":"500人",
      "inc":"蚂蚁集团起步于2004年诞生的支付宝，源于一份为社会解决信任问题的初心，经过十九年的发展，已成为世界领先的互联网开放平台。我们通过科技创新，助力合作伙伴，为消费者和小微企业提供普惠便捷的数字生活及数字金融服务；持续开放产品与技术，助力企业的数字化升级与协作；在全球广泛合作，服务当地商家和消费者实现“全球收”、“全球付”和“全球汇”。"
    },
     {
      "logo":"https://img1.baidu.com/it/u=3848315783,3916699571&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
      "name":"百度",
      "location":"北京市朝阳区",
      "type":"互联网",
      "size":"已上市",
      "employee":"10000人以上",
      "hot":"架构师",
      "count":"300人",
      "inc":"蚂蚁集团起步于2004年诞生的支付宝，源于一份为社会解决信任问题的初心，经过十九年的发展，已成为世界领先的互联网开放平台。我们通过科技创新，助力合作伙伴，为消费者和小微企业提供普惠便捷的数字生活及数字金融服务；持续开放产品与技术，助力企业的数字化升级与协作；在全球广泛合作，服务当地商家和消费者实现“全球收”、“全球付”和“全球汇”。"
    },
    {
      "logo":"https://img1.baidu.com/it/u=3848315783,3916699571&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500",
      "name":"百度",
      "location":"北京市朝阳区",
      "type":"互联网",
      "size":"已上市",
      "employee":"10000人以上",
      "hot":"架构师",
      "count":"300人",
      "inc":"蚂蚁集团起步于2004年诞生的支付宝，源于一份为社会解决信任问题的初心，经过十九年的发展，已成为世界领先的互联网开放平台。我们通过科技创新，助力合作伙伴，为消费者和小微企业提供普惠便捷的数字生活及数字金融服务；持续开放产品与技术，助力企业的数字化升级与协作；在全球广泛合作，服务当地商家和消费者实现“全球收”、“全球付”和“全球汇”。"
    },
    {
      "logo":"https://c-ssl.dtstatic.com/uploads/blog/202208/15/20220815162412_00e47.thumb.400_0.jpeg",
      "name":"百度",
      "location":"北京市朝阳区",
      "type":"互联网",
      "size":"已上市",
      "employee":"10000人以上",
      "hot":"架构师",
      "count":"300人",
      "inc":"蚂蚁集团起步于2004年诞生的支付宝，源于一份为社会解决信任问题的初心，经过十九年的发展，已成为世界领先的互联网开放平台。我们通过科技创新，助力合作伙伴，为消费者和小微企业提供普惠便捷的数字生活及数字金融服务；持续开放产品与技术，助力企业的数字化升级与协作；在全球广泛合作，服务当地商家和消费者实现“全球收”、“全球付”和“全球汇”。"
    },
    {
      "logo":"https://c-ssl.dtstatic.com/uploads/blog/202208/15/20220815162412_00e47.thumb.400_0.jpeg",
      "name":"百度",
      "location":"北京市朝阳区",
      "type":"互联网",
      "size":"已上市",
      "employee":"10000人以上",
      "hot":"架构师",
      "count":"300人",
      "inc":"蚂蚁集团起步于2004年诞生的支付宝，源于一份为社会解决信任问题的初心，经过十九年的发展，已成为世界领先的互联网开放平台。我们通过科技创新，助力合作伙伴，为消费者和小微企业提供普惠便捷的数字生活及数字金融服务；持续开放产品与技术，助力企业的数字化升级与协作；在全球广泛合作，服务当地商家和消费者实现“全球收”、“全球付”和“全球汇”。"
    }
  ]
}""");
    });
  }

  nacCompanyDetail(company, index) {
    Navigator.of(context).push(PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, animation, secondaryAnimation) {
        return CompanyDetail(company);
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween(
              begin: Offset(0.0, 1.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
      },
    ));
  }
}
