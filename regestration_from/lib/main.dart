
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:regestration_from/models/contact.dart';
import 'package:regestration_from/util/database_helper.dart';

void main() {
  runApp(MyApp());
}

const darkBlueColor = Color(0xff486579);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register From',
      theme: ThemeData(
        primaryColor: darkBlueColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Register From Create'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Contact _contact = Contact();
  List<Contact> _contacts = [];
  DatabaseHelper _dbHelper;


  final _ctrlName = TextEditingController();
  final _ctrlMobile = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      _dbHelper = DatabaseHelper.instance;


    });
    _refreshContactList();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            widget.title,
            style: TextStyle(color: darkBlueColor),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[_form(), _list()],
        ),
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();

  _form() => Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _ctrlName,
                decoration: InputDecoration(labelText: 'Full Name'),
                validator: (val) =>
                    (val.length == 0 ? 'This field is mandatory' : null),
                onSaved: (val) => setState(() => _contact.name = val),
              ),
              TextFormField(
                controller: _ctrlMobile,
                decoration: InputDecoration(labelText: 'Mobile'),
                validator: (val) =>
                    val.length < 10 ? '10 characters required' : null,
                onSaved: (val) => setState(() => _contact.mobile = val),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: RaisedButton(
                  onPressed: () => _onSubmit(),
                  child: Text('Submit'),
                  color: darkBlueColor,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );

  _refreshContactList() async {
    List<Contact> x = await _dbHelper.fetchContacts();
    setState(() {
      _contacts = x;
    });
  }

  _onSubmit() async {
    var form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      if (_contact.id == null) {
        await _dbHelper.insertContact(_contact);
      } else if (_contact.id != null) {
        await _dbHelper.updateContact(_contact);
      }

      _refreshContactList(); // reset list
      form.reset();  //instert reset
      _resetForm();
      _formKey.currentState.reset();
      _ctrlName.clear();
      _ctrlMobile.clear();
    }
  }

  _resetFrom() {
    setState(() {});
  }

  _list() => Expanded(
        child: Card(
          margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: Scrollbar(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.account_circle,
                        color: darkBlueColor,
                        size: 30.0,
                      ),
                      title: Text(
                        _contacts[index].name.toUpperCase(),
                        style: TextStyle(
                            color: darkBlueColor, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(_contacts[index].mobile),
                      /*
                      trailing: IconButton(
                        icon: Icon(Icons.delete_sweep, color: darkBlueColor),
                        onPressed: () async {
                          await _dbHelper.deleteContact(_contacts[index].id);
                          _resetForm();
                          _refreshContactList();
                        },
                */
                        onTap: () {
                          setState(() {
                            // _showForEdit(index);
                            _resetForm();
                            _contact = _contacts[index];
                            _ctrlName.text = _contacts[index].name;
                            _ctrlMobile.text = _contacts[index].mobile;
                          });
                        },

                      ),


                    Divider(
                      height: 5.0,
                    ),
                  ],
                );
              },
              itemCount: _contacts.length,
            ),
          ),
        ),
      );
/*
  _showForEdit(index) {
    setState(() {
      _contact = _contacts[index];
      _ctrlName.text = _contacts[index].name;
      _ctrlMobile.text = _contacts[index].mobile;
    });
  }
  */


  _resetForm() {
    setState(() {
      _formKey.currentState.reset();
      _contact.id = null;
      _ctrlName.clear();
      _ctrlMobile.clear();
    });
  }
}
