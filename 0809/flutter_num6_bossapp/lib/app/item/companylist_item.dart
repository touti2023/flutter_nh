import 'package:flutter/material.dart';
import '../model/company.dart';

class CompanyListItem extends StatelessWidget {
  final Company company;
  CompanyListItem(this.company);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 3, left: 5, right: 5, bottom: 3),
      child: SizedBox(
        child: Card(
          elevation: 0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 0),
                child: Image.network(
                  company.logo,
                  width: 50,
                  height: 50,
                ),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: Text(
                      company.name,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 15),
                    ),
                    margin: EdgeInsets.only(top: 10, bottom: 5),
                  ),
                  Padding(
                      padding:
                          EdgeInsets.only(top: 5, left: 0, right: 5, bottom: 5),
                      child: Text(
                        company.location,
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      )),
                  Padding(
                      padding:
                          EdgeInsets.only(top: 5, left: 0, right: 5, bottom: 5),
                      child: Text(
                        company.type +
                            " | " +
                            company.size +
                            " | " +
                            company.employee,
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      )),
                  Divider(),
                  Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                              top: 5, left: 0, right: 5, bottom: 15),
                          child: Text(
                            '热招: ' + company.hot + ' 等' + company.count + '个职位',
                            style: TextStyle(fontSize: 13, color: Colors.grey),
                          )),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 8),
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ))
                    ],
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
