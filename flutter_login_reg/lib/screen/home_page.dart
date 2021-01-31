import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_reg/models/auth.dart';

import 'package:http/http.dart' as http;
import 'package:flutter_login_reg/models/user.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  @override
  Widget build(BuildContext context) {
    //final _auth = Provider.of<AuthModel>(context, listen: true);

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
          ),

          ListTile(
            title: new Text("About"),
            leading: new Icon(Icons.details),
          ),
          ListTile(
            title: new Text("LogOut"),
            leading: Icon(Icons.logout),
            //if(user.flaglogged == "logged") {

            // textScaleFactor: textScaleFactor,
              //Navigator.pop(context);

            //onTap: () => _auth.logout(),
          ),


          /*
          ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text(
              'Logout',
              textScaleFactor: textScaleFactor,
            ),
            onTap: () => _auth.logout(),
          ),
    */
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
        msg: 'This is toast notification flull',
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

/*
Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response =
  await client.get('https://jsonplaceholder.typicode.com/photos');

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parsePhotos, response.body);

}


// A function that converts a response body into a List<Photo>.
List<Photo> parsePhotos(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final appTitle = 'Home Page - Photos';

    return new Scaffold(
      body: new Center(
        child: MyHomePage(title: appTitle),
      ),
    );
  }
}


class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? PhotosList(photos: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  final List<Photo> photos;

  PhotosList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Image.network(photos[index].thumbnailUrl);
      },
    );
  }
}
 Database _db;
final String tableUser = "User";
final String columnName = "name";
final String columnUserName = "username";
final String columnPassword = "password";

class usalist extends StatefulWidget {
  @override
  usalist_State createState() => usalist_State();
}

class usalist_State extends State<usalist> {
  @override
  Widget build(BuildContext context) {

    Future<int> saveUser(User user) async {
      var dbClient = await _db;
      print(user.name);
      int res = await dbClient.insert("User", user.toMap());
      List<Map> list = await dbClient.rawQuery('SELECT * FROM User');
      print(list);
      return res;
    }
    //return Container();
  }
}

*/
