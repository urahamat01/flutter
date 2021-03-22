import 'package:flutter/material.dart';

class CloseShoutScreen extends StatelessWidget {
  // onSelectChanged: (_) {
  // showDialog(
  // context: context,
  // // child: chickedDialog
  // child: AlertDialog(
  // title: Text('Catgory/ Sub Catgory'),
  // titleTextStyle: TextStyle(
  // fontSize: 25, color: Colors.black),
  // content: Column(
  // children: <Widget>[
  // Text(
  // "${Utility.formatDate(
  // Utility.convertStringToDate(
  // myReport.reportDate,
  // ),
  // )}",
  // ),
  // Text(
  // "${myReport.time} ",
  // ),
  // Text(
  // "${myReport.cat}",
  // ),
  // Text(
  // "${myReport.subCat}",
  // ),
  // Text(
  // "${myReport.urgency}",
  // ),
  // Text(
  // "${myReport.responderPartyName}",
  // ),
  // SizedBox(
  // height: 15,
  // ),
  // TextField(
  // maxLines: 10,
  // minLines: 3,
  // keyboardType:
  // TextInputType.multiline,
  // decoration: InputDecoration(
  // hintText: "Enter your text here",
  // alignLabelWithHint: true,
  // border: OutlineInputBorder(),
  // labelText: 'Remarks',
  // ),
  // ),
  // SizedBox(
  // height: 20,
  // ),
  // Row(
  // mainAxisAlignment:
  // MainAxisAlignment.center,
  // children: <Widget>[
  // Expanded(
  // child: FlatButton(
  // color: Colors.green,
  // splashColor: Colors.black12,
  // onPressed: () {},
  // child: Text("Complete"),
  // ),
  // ),
  // SizedBox(width: 10),
  // Expanded(
  // child: FlatButton(
  // color: Colors.red,
  // splashColor: Colors.black12,
  // onPressed: () {},
  // child: Text("Drop"),
  // ),
  // ),
  // ],
  // )
  // ],
  // ),
  // actions: <Widget>[
  // TextButton(
  // child: Text('close'),
  // onPressed: () {
  // Navigator.of(context).pop();
  // },
  // ),
  // ],
  // ),
  // );
  // },

  final List<Map<String, String>> MyReports = [
    {
      "Date": "27-02-2021",
      "Time": "10:30 AM",
      "Category": "Crime",
      "Sub Category": "Murder",
      "Unit": "High",
      "Office": "Gulshan Thana",
    },
    {
      "Date": "29-02-2021",
      "Time": "10:30 AM",
      "Category": "Murder",
      "Sub Category": "Murder",
      "Unit": "High",
      "Office": "Gulshan ",
    },
    {
      "Date": "30-02-2021",
      "Time": "10:30 AM",
      "Category": "Murder",
      "Sub Category": "Murder",
      "Unit": "High",
      "Office": "Gulshan Thana",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
            child: Text(
              'Close Shout',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
            child: Text(
              'Runing Works',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          child: DataTable(
            showCheckboxColumn: false,
            horizontalMargin: 0,
            columnSpacing: 15,
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  "Date",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  "Time",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  "Category",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                numeric: false,
                label: Text(
                  "Sub Category",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  "Unit",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  "Office",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
            rows: MyReports.map(((element) => DataRow(
                  cells: <DataCell>[
                    DataCell(
                      Text(element["Date"]),
                    ),
                    DataCell(
                      Text(element["Time"]),
                    ),
                    DataCell(
                      Text(element["Category"]),
                    ),
                    DataCell(
                      Text(element["Sub Category"]),
                    ),
                    DataCell(
                      Text(element["Unit"]),
                    ),
                    DataCell(
                      Text(element["Office"]),
                    )
                  ],
                  onSelectChanged: (_) {
                    // insert your navigation function here and use the selected value returned by the function
                    // Navigator.of(context).pop();
                    showDialog(
                        context: context,
                        // child: chickedDialog
                        child: AlertDialog(
                          title: Text('Cat/ Sub Cat'),
                          titleTextStyle:
                              TextStyle(fontSize: 25, color: Colors.black),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text(element["Date"]),
                                Text(element["Time"]),
                                Text(element["Category"]),
                                Text(element["Sub Category"]),
                                Text(element["Unit"]),
                                Text(element["Office"]),
                                SizedBox(
                                  height: 15,
                                ),
                                TextField(
                                  maxLines: 10,
                                  minLines: 3,
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                    hintText: "Enter your text here",
                                    alignLabelWithHint: true,
                                    border: OutlineInputBorder(),
                                    labelText: 'Remarks',
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: FlatButton(
                                        color: Colors.green,
                                        splashColor: Colors.black12,
                                        onPressed: () {},
                                        child: Text("Complete"),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: FlatButton(
                                        color: Colors.red,
                                        splashColor: Colors.black12,
                                        onPressed: () {},
                                        child: Text("Drop"),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text('close'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ));
                  },
                ))).toList(),
          ),
        ),
      ],
    );
  }
}
