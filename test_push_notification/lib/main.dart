import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:test_push_notification/dataTableAlert/Utility.dart';
import 'package:test_push_notification/dataTableAlert/my_reports.dart';

import 'PaginatedDataTable/paginatedDataTable.dart';
import 'dataTableAlert/closeShout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CloseShout(
        title: 'User Rating',
      ),
    );
  }
}

///ToDo ExpandableListView
///ToDo PagintationList
