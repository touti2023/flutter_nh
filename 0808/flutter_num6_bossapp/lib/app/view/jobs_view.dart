import 'package:flutter/material.dart';
import '../item/joblist_item.dart';
import '../model/job.dart';

class JobsTab extends StatefulWidget {
  @override
  State<JobsTab> createState() => _JobsTabState();
}

class _JobsTabState extends State<JobsTab> {
  List<Job> _jobs = [];

  @override
  void initState() {
    getJobList();
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
          'Android',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body:
          ListView.builder(itemCount: _jobs.length, itemBuilder: buildJobItem),
    );
  }

  Widget buildJobItem(BuildContext context, int index) {
    Job job = _jobs[index];

    var jobItem = InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: Text(
                    '期待心情!',
                    style: TextStyle(fontSize: 20),
                  ),
                ));
      },
      child: JobListItem(job),
    );
    return jobItem;
  }

  void getJobList() {
    setState(() {
      _jobs = Job.fromJson("""
{
  "list":[
    {
      "name":"架构师 (Android)",
      "cname":"蚂蚁金服",
      "size":"B轮",
      "salary":"25k-45k",
      "username":"Claie",
      "title":"HR"
    },
    {
      "name":"资深架构师 (Android)",
      "cname":"今日头条",
      "size":"D轮",
      "salary":"40k-60k",
      "username":"Kimi",
      "title":"HRBP"
    }
  ]
}""");
    });
  }
}
