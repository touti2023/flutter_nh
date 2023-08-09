import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompanyInc extends StatelessWidget {
  final String _companyInc;

  CompanyInc(this._companyInc);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      '公司介绍',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
              RichText(
                  text: TextSpan(
                      text: _companyInc,
                      style: TextStyle(fontSize: 13, color: Colors.black)))
            ],
          ),
        ),
      ),
    );
  }
}
