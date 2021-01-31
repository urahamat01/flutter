import 'package:flutter/material.dart';
import 'package:flutter_login_reg/data/database-helper.dart';
import 'package:flutter_login_reg/models/user.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  BuildContext _ctx;
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _name, _username, _password;

  @override
  Widget build(BuildContext context) {

    _ctx = context;
    var loginBtn = new RaisedButton(



      onPressed: _submit,

      child: new Text("Register"),
      color: Colors.green,
    );

    var loginForm = new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Text(
          "Sqflite App Register",
          textScaleFactor: 2.0,
        ),
        new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                  decoration: new InputDecoration(labelText: "Name"),
                  validator: (val) =>
                      (val.length == 0 ? 'This field is mandatory Name' : null),
                  onSaved: (val) => setState(() => _name = val),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                  // onSaved: (val) => _username = val,
                  decoration: new InputDecoration(labelText: "Email"),
                  validator: (val) =>

                      // var email = "tony123_90874.coder@yahoo.co.in",
                      // bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(email),
                      //print (emailValid),

                      //import 'package:email_validator/email_validator.dart';
                      //var email = "fredrik@gmail.com";

                      //assert(EmailValidator.validate(email));

                      val.length < 6 ? '6 characters Email' : null,
                  onSaved: (val) => setState(() => _username = val),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(10.0),
                child: new TextFormField(
                  //onSaved: (val) => _password = val,
                  decoration: new InputDecoration(labelText: "Password"),
                  validator: (val) =>
                      val.length < 6 ? '6 characters password' : null,
                  onSaved: (val) => setState(() => _password = val),
                ),
              )
            ],
          ),
        ),
        loginBtn
      ],
    );

    return new Scaffold(

      appBar: new AppBar(

        title: new Text("Register"),
      ),
      key: scaffoldKey,
      body: new Container(
        child: new Center(
          child: loginForm,
        ),
      ),
    );
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      setState(() async {
        _isLoading = true;
        form.save();
        var user = new User(_name, _username, _password, null);
        var db = new DatabaseHelper();

        if (user == null) {
          db.saveUser(user);
        } else {
          db.updateContact(user);
        }
        if (db == user) {
          db.deleteUser(user);
        }
        _isLoading = false;

        Navigator.of(context).pushNamed("/login");
      });
    }
  }
}
