import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);


  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Scaffold Example'),
      ),

      body: Center(
        child: Text('We have pressed the button $ToastExample times'),

      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      drawer: Drawer(
        elevation: 20.0,
        child: Column(children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("javatpoint"),
            accountEmail: Text("javatpoint@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.yellow,
              child: Text("abc"),


            ),
          ),
          ListTile(
            title: new Text("Inbox"),
            leading: new Icon(Icons.mail),
          ),
          Divider(
            height: 0.1,
          ),
          ListTile(
            title: new Text("Primary"),
            leading: new Icon(Icons.inbox),
          ),
          ListTile(
            title: new Text("Social"),
            leading: new Icon(Icons.people),
          ),
          ListTile(
            title: new Text("Promotions"),
            leading: new Icon(Icons.local_offer),
          )
        ]),
      ),

    );
  }
}

class MyButton extends StatefulWidget {
  @override
  _MyButtonState createState() => _MyButtonState();

}

class _MyButtonState extends State<MyButton> {
  String _name = "Peter";

  @override
  Widget build(BuildContext context) {
    return RaisedButton(

      child: Text(_name),
      onPressed: () {
        setState(() {

          _name = _name == "Peter" ? "John" : "Peter";
        });
      },
    );
  }
}

class ToastExample extends StatefulWidget {
  @override
  _ToastExampleState createState() => _ToastExampleState();
}

class _ToastExampleState extends State {
  void showToast() {
    Fluttertoast.showToast(
        msg: 'This is toast notification',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.yellow);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toast Notification Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Toast Notification Example'),
        ),
        body: Padding(
          padding: EdgeInsets.all(15.0),
          child: Center(
            child: RaisedButton(
              child: Text('Toast Notification Example'),
              onPressed: showToast,
            ),
          ),
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}

class CardViews extends StatefulWidget {
  @override
  _CardViewsState createState() => _CardViewsState();
}

class _CardViewsState extends State<CardViews> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,

        child: Card(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
    ),
    ),
    );
  }
}

