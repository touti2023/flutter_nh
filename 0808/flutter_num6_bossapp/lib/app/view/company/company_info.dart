import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../model/company.dart';

class CompanyInfo extends StatelessWidget {
  final Company company;
  const CompanyInfo({required this.company, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SizedBox(
        child: Card(
          elevation: 0,
          child: Row(
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
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 5, left: 0, right: 5, bottom: 5),
                    child: Text(
                      company.type +
                          ' | ' +
                          company.size +
                          ' | ' +
                          company.employee,
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
