import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_push_notification/dataTableAlert/my_reports.dart';
import 'package:toast/toast.dart';
import 'Utility.dart';

class CloseShout extends StatefulWidget {
  final String title;

  const CloseShout({Key key, this.title}) : super(key: key);

  @override
  _CloseShoutState createState() => _CloseShoutState();
}

class _CloseShoutState extends State<CloseShout> {
  var myReports = MyReports.fetchAll();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(15),
        child: DataTable(
          showCheckboxColumn: false,
          horizontalMargin: 0,
          columnSpacing: 15,
          columns: [
            DataColumn(
              numeric: true,
              label: Text(
                'Date',
              ),
            ),
            DataColumn(
              label: Text(
                'Time',
              ),
            ),
            DataColumn(
              label: Text(
                'Category',
              ),
            ),
            DataColumn(
              label: Text(
                'Sub Category',
              ),
            ),
            DataColumn(
              label: Text(
                'Unit',
              ),
            ),
            DataColumn(
              label: Text(
                'Office',
              ),
            ),
          ],
          rows: myReports
              .map(
                (myReport) => DataRow(
                  cells: [
                    DataCell(
                      Text(
                        "${Utility.formatDate(
                          Utility.convertStringToDate(
                            myReport.reportDate,
                          ),
                        )}",
                      ),
                    ),
                    DataCell(
                      Text(
                        "${myReport.time}",
                      ),
                    ),
                    DataCell(
                      Text(
                        "${myReport.cat}",
                      ),
                    ),
                    DataCell(
                      Text(
                        "${myReport.subCat}",
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '',
                          arguments: myReport,
                        );
                      },
                    ),
                    DataCell(
                      Text(
                        "${myReport.urgency}",
                      ),
                    ),
                    DataCell(
                      Text(
                        "${myReport.responderPartyName}",
                      ),
                    ),
                  ],
                  onSelectChanged: (value) {
                    showMyDialog(context: context, myReport: myReport);
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  // Future<Widget> showMyDialog({BuildContext context, MyReports myReport}) {
  //   return showDialog(
  //     context: context,
  //     child: AlertDialog(
  //       title: Text('Category/ Sub_Category: '),
  //       titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
  //       content: SingleChildScrollView(
  //         child: ListBody(
  //           children: <Widget>[
  //             Text(
  //               "${Utility.formatDate(
  //                 Utility.convertStringToDate(
  //                   myReport.reportDate,
  //                 ),
  //               )}",
  //             ),
  //             Text(
  //               "${myReport.time} ",
  //             ),
  //             Text(
  //               "${myReport.cat}",
  //             ),
  //             Text(
  //               "${myReport.subCat}",
  //             ),
  //             Text(
  //               "${myReport.urgency}",
  //             ),
  //             Text(
  //               "${myReport.responderPartyName}",
  //             ),
  //             SizedBox(
  //               height: 10,
  //             ),
  //             TextField(
  //               maxLines: 10,
  //               minLines: 3,
  //               keyboardType: TextInputType.multiline,
  //               decoration: InputDecoration(
  //                 hintText: "Enter your text here",
  //                 alignLabelWithHint: true,
  //                 border: OutlineInputBorder(),
  //                 labelText: 'Remarks',
  //               ),
  //             ),
  //             SizedBox(
  //               height: 20,
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: <Widget>[
  //                 Expanded(
  //                   child: FlatButton(
  //                     color: Colors.green,
  //                     splashColor: Colors.black12,
  //                     onPressed: () {},
  //                     child: Text("Complete"),
  //                   ),
  //                 ),
  //                 SizedBox(width: 10),
  //                 Expanded(
  //                   child: FlatButton(
  //                     color: Colors.red,
  //                     splashColor: Colors.black12,
  //                     onPressed: () {},
  //                     child: Text("Drop"),
  //                   ),
  //                 ),
  //               ],
  //             )
  //           ],
  //         ),
  //       ),
  //       actions: <Widget>[
  //         TextButton(
  //           child: Text('close'),
  //           onPressed: () {
  //             Navigator.of(context).pop();
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Future<Widget> showMyDialog({BuildContext context, MyReports myReport}) {
    bool rating = true;
    bool painRating = false;
    bool sOso = false;
    bool good = false;
    bool varyGood = false;
    bool excelent = false;

    return showDialog(
      context: context,
      child: AlertDialog(
        contentPadding: EdgeInsets.all(8),
        title: Text(
          "${myReport.cat} > ${myReport.subCat}",
        ),
        titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
        content: SingleChildScrollView(
          //scrollDirection: Axis.vertical,
          child: ListBody(
            children: <Widget>[
              Text(
                "${Utility.formatDate(
                  Utility.convertStringToDate(
                    myReport.reportDate,
                  ),
                )}",
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "${myReport.time} ",
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "${myReport.urgency}",
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "${myReport.responderPartyName}",
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Closer: ',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 30.0,
                                  //backgroundImage: NetworkImage("image-url"),
                                  backgroundColor: Colors.black45,
                                )

                                // Icon(
                                //   Icons.account_circle,
                                //   color: Colors.black54,
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "${myReport.assignedUserFullName} ",
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${myReport.responderPartyName}",
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                    ],
                  ),
                  elevation: 1.0,
                ),
              ),
              Text(
                'Rating: ',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Card(
                elevation: 2.0,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            InkWell(
                              child: Icon(
                                Icons.sentiment_very_dissatisfied,
                                color: Colors.red,
                              ),
                              onTap: () {
                                debugPrint('Not Done');
                                // Fluttertoast.showToast(
                                //   msg: "This is Toast messaget",
                                //   gravity: ToastGravity.CENTER,
                                // );
                              },
                            ),
                            Text(
                              'Not Done',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  child: Icon(
                                    Icons.sentiment_satisfied,
                                    color: Colors.grey,
                                  ),
                                  onTap: () {
                                    debugPrint('SoSo');
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 13.0,
                            ),
                            Text(
                              'SoSo',
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  child: Icon(
                                    Icons.sentiment_satisfied_alt_sharp,
                                    color: Colors.cyanAccent,
                                  ),
                                  onTap: () {
                                    debugPrint('Good');
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 13.0,
                            ),
                            Text(
                              'Good',
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                              child: Icon(
                                Icons.sentiment_very_satisfied_outlined,
                                color: Colors.yellow,
                              ),
                              onTap: () {
                                debugPrint('Vary Good');
                              },
                            ),
                            Text(
                              'Vary Good',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            child: Icon(
                              Icons.sentiment_very_satisfied,
                              color: Colors.green,
                            ),
                            onTap: () {
                              debugPrint('Excellent');
                            },
                          ),
                          SizedBox(
                            height: 13.0,
                          ),
                          Text(
                            'Excellent',

                            // overflow: TextOverflow.fade,
                            // maxLines: 1,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              TextField(
                maxLines: 5,
                minLines: 1,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: "Enter your text here",
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
                  labelText: 'Remarks',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        // gradient: LinearGradient(
                        //   colors: <Color>[
                        //     Color(0xFF626263),
                        //   ],
                        // ),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child:
                          const Text('Submit', style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
