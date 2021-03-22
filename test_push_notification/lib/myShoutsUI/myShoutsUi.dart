import 'package:flutter/material.dart';
import 'package:test_push_notification/myShoutsUI/Utility.dart';
import 'package:test_push_notification/myShoutsUI/my_reports.dart';

class MyShoutsUI extends StatefulWidget {
  final String title;

  const MyShoutsUI({Key key, this.title}) : super(key: key);

  @override
  _MyShoutsUIState createState() => _MyShoutsUIState();
}

class _MyShoutsUIState extends State<MyShoutsUI> {
  var myReports = MyReports.fetchAll();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(),
    );
  }

  //Solution Rating:

  //https://flutter.dev/docs/cookbook/gestures/handling-taps
  //https://stackoverflow.com/questions/46637566/how-to-create-rating-star-bar-properly

  Future<Widget> showMyDialog({BuildContext context, MyReports myReport}) {
    return showDialog(
      context: context,
      child: AlertDialog(
        title: Text('Cat/ Sub_Cat: '),
        titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                "${Utility.formatDate(
                  Utility.convertStringToDate(
                    myReport.reportDate,
                  ),
                )}",
              ),
              Text(
                "${myReport.time} ",
              ),
              Text(
                "${myReport.cat}",
              ),
              Text(
                "${myReport.subCat}",
              ),
              Text(
                "${myReport.urgency}",
              ),
              Text(
                "${myReport.responderPartyName}",
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  semanticContainer: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  //clipBehavior: Clip.antiAlias,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ListBody(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Closer: ',
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.search,
                                        color: Colors.grey,
                                      ),
                                      onPressed: () {},
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Icon(
                                    Icons.account_circle,
                                    color: Colors.grey,
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${myReport.assignedUsername} ",
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${myReport.responderPartyName}",
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                'Rating: ',
              ),
              SizedBox(
                height: 6.0,
              ),
              Card(
                semanticContainer: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                //clipBehavior: Clip.antiAlias,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topLeft,
                              child: Icon(
                                Icons.sentiment_very_dissatisfied,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              'Not Done',
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 2.0),
                                child: Icon(
                                  Icons.sentiment_satisfied,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 17.0, top: 0.0),
                              child: Text(
                                'SoSo',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 2.0),
                                child: Icon(
                                  Icons.sentiment_satisfied_alt_sharp,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 17.0, top: 0.0),
                              child: Text(
                                'Good',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topLeft,
                              child: Icon(
                                Icons.sentiment_very_satisfied_outlined,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              'Vary Good',
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topLeft,
                              child: Icon(
                                Icons.sentiment_very_satisfied,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              'Excelent',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 8,
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
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF1B60CD),
                            Color(0xFF2568A7),
                            Color(0xFF42A5F5),
                          ],
                        ),
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

// Card(
//   child: Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         ListBody(
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Expanded(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         'Closer: ',
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.black87,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Icon(
//                       Icons.account_circle,
//                       color: Colors.blue,
//                     ),
//                   ],
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             Text(
//               "${myReport.assignedUserFullName} ",
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Text(
//               "${myReport.responderPartyName}",
//             ),
//             SizedBox(
//               height: 10,
//             ),
//           ],
//         ),
//       ],
//     ),
//   ),
//   elevation: 2.0,
// ),
