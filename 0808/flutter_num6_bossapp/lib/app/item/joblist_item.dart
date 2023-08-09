import 'package:flutter/material.dart';
import '../model/job.dart';

class JobListItem extends StatelessWidget {
  final Job job;

  JobListItem(this.job);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 3, left: 5, right: 5, bottom: 3),
      child: SizedBox(
        child: Card(
          elevation: 0.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 10,
                          left: 10,
                          bottom: 5,
                        ),
                        child: Text(job.name),
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(
                              job.salary,
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      ))
                    ],
                  ),
                  Container(
                    child: Text(
                      job.cname + ' ' + job.size,
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    margin: EdgeInsets.only(top: 5, left: 10, bottom: 5),
                  ),
                  Divider(),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: 5, left: 10, right: 5, bottom: 15),
                        child: Text(
                          job.username + ' | ' + job.title,
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 215, 198)),
                        ),
                      )
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
