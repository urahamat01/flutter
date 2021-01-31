import 'package:flutter/material.dart';
import 'package:test_projects/screens/card_details/item_details.dart';
import 'package:test_projects/screens/card_details/item_flutter.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class DashboardPage extends StatelessWidget {
  String title;

  final GlobalKey _menuKey = new GlobalKey();

  DashboardPage({Key key, this.title}) : super(key: key);

  String _timeString;

  // @override
  // void initState(){
  //   super.initState();
  // }
  //
  // void _getTime() {
  //   final String formattedDateTime =
  //   DateFormat('yyyy-MM-dd \n kk:mm:ss').format(DateTime.now()).toString();
  //   setState(() {
  //     _timeString = formattedDateTime;
  //     print(_timeString);
  //   });
  //_timeString.toString
  // }

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Deshboard')),
        actions: [
          PopupMenuButton(
              key: _menuKey,
              itemBuilder: (_) => <PopupMenuItem<String>>[
                    PopupMenuItem<String>(
                        child: const Text('Rate App'), value: 'Rate App'),
                    PopupMenuItem<String>(
                        child: const Text('Contact'), value: 'Contact'),
                    PopupMenuItem<String>(
                        child: const Text('Logout'), value: 'Logout'),
                  ],
              onSelected: (_) {}),
        ],
        elevation: .1,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 8.0,
            children: List.generate(choices.length, (index) {
              return Center(
                child: SelectCard(
                  choice: choices[index],
                ),
              );
            })),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              child: UserAccountsDrawerHeader(
                accountName: Text("Rahamat Ullah"),
                accountEmail: Text("mdrahamat0505@gmail.com"),

                // currentAccountPicture: CircleAvatar(
                //   backgroundColor: Colors.lightGreen,
                //   child: Text(
                //     "A",
                //     style: TextStyle(fontSize: 30.0),
                //   ),
                // ),
                otherAccountsPictures: <Widget>[
                  Container(
                    child: CircleAvatar(
                      backgroundColor: Colors.lightGreen,
                      child: Text(
                        "A",
                        style: TextStyle(fontSize: 30.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Flutter Bases"),
              onTap: () {
                //Navigator.pop(context);

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ItemDetails()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.web),
              title: Text("Flutter Web"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ItemFlutter()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.add_circle_outline),
              title: Text("Flutter Advance"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 300),
                child: ListTile(
                  leading: Icon(
                    Icons.settings,
                  ),
                  title: Text(
                    "Setting",
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.lightBlue,
        height: 50,
        child: Center(
          child: Text(
            "|| " +
                "Date: " +
                now.day.toString() +
                "-" +
                now.month.toString() +
                "-" +
                now.year.toString() +
                "  &  Time: " +
                now.hour.toString() +
                ":" +
                now.minute.toString() +
                ":" +
                now.second.toString() +
                " ||",
          ),
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Flutter bas', icon: Icons.home),
  const Choice(title: 'Flutter Web', icon: Icons.web),
  const Choice(title: 'Map', icon: Icons.map),
  const Choice(title: 'Java', icon: Icons.phone),
  const Choice(title: 'Java Advance', icon: Icons.camera_alt),
  const Choice(title: 'Android', icon: Icons.settings),
  const Choice(title: 'Deart', icon: Icons.photo_album),
  const Choice(title: 'Ios', icon: Icons.wifi),
  const Choice(title: 'Python', icon: Icons.wifi),
];

//select Card choice widget

class SelectCard extends StatelessWidget {
  const SelectCard({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;

    return Scaffold(
      body: Container(
        child: Card(
            elevation: 1.0,
            margin: EdgeInsets.all(3.0),
            color: Colors.lightBlueAccent,
            child: Container(
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ItemDetails()));
                  //    cardTitle: choice.title, cardDetails: "Hello Card: $choice.title",
                },
                child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      verticalDirection: VerticalDirection.down,
                      children: <Widget>[
                        SizedBox(
                          height: 20.0,
                        ),
                        Center(
                            child: Icon(choice.icon,
                                size: 25.0, color: textStyle.color)),
                        SizedBox(
                          height: 20.0,
                        ),
                        Center(
                          child: Text(
                            choice.title,
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            )),
      ),
    );
  }
}
