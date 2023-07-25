import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../model/post.dart';

class PostDataSource extends DataTableSource {
  final List<Post> _posts = posts;
  int _selectedCount = 0;

  @override
  int get rowCount => _posts.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  @override
  DataRow getRow(index) {
    final Post post = _posts[index];

    return DataRow.byIndex(index: index, cells: <DataCell>[
      DataCell(Text(post.title)),
      DataCell(Text(post.author)),
      DataCell(Image.network(
          'https://c-ssl.dtstatic.com/uploads/item/201802/13/20180213154038_fetrj.thumb.400_0.png')),
    ]);
  }
}

class PaginatedDataTableDemo extends StatefulWidget {
  @override
  _PaginatedDataTableDemoState createState() => _PaginatedDataTableDemoState();
}

class _PaginatedDataTableDemoState extends State<PaginatedDataTableDemo> {
  int? _sortColumnIndex;
  bool _sortAscending = true;

  final PostDataSource _postDataSource = PostDataSource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PaginatedDataTableDmo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(children: <Widget>[
          PaginatedDataTable(
            header: Text('Posts'),
            //每页行数
            rowsPerPage: 5,
            source: _postDataSource,
            sortColumnIndex: _sortColumnIndex,
            sortAscending: _sortAscending,
            columns: [
              DataColumn(
                label: Text('Title'),
                onSort: (columnIndex, ascending) {
                  setState(() {
                    _sortColumnIndex = columnIndex;
                    _sortAscending = ascending;

                    posts.sort((a, b) {
                      if (!ascending) {
                        final c = a;
                        a = b;
                        b = c;
                      }

                      return a.title.length.compareTo(b.title.length);
                    });
                  });
                },
              ),
              DataColumn(label: Text('Author')),
              DataColumn(label: Text('Image')),
            ],
            // rows: posts.map(
            //   (post) {
            //     return DataRow(
            //         //复选框
            //         selected: post.selected,
            //         onSelectChanged: (value) {
            //           setState(() {
            //             if (post.selected != value) {
            //               post.selected = value!;
            //             }
            //           });
            //         },
            //         cells: [
            //           DataCell(Text(post.title)),
            //           DataCell(Text(post.author)),
            //           DataCell(Image.network(post.imageUrl)),
            //         ]);
            //   },
            // ).toList(),
          ),
        ]),
      ),
    );
  }
}
