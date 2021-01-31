import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_reg/models/user.dart';
import 'package:flutter_login_reg/screen/login/login_presenter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginPageContract {
  BuildContext _ctx;
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffolKey = new GlobalKey<ScaffoldState>();
  String _email, _password;

  LoginPagePresenter _presenter;

  _LoginPageState() {
    _presenter = new LoginPagePresenter(this);
  }

  void _register() {
    Navigator.of(context).pushNamed("/register");
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      setState(() {
        _isLoading = true;
        form.save();
        _presenter.doLogin(_email, _password);
      });
    }
  }

  void _showSnackBar(String text) {
    scaffolKey.currentState.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    var loginBtn = new RaisedButton(
      onPressed: _submit,
      child: new Text("Login"),
      color: Colors.green,
    );
    var registerBtn = new RaisedButton(
      padding: const EdgeInsets.all(10.0),
      onPressed: _register,
      child: new Text("Register"),
      color: Colors.green,
    );

    var loginForm = new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Text(
          "Sqflite App Login",
          textScaleFactor: 2.0,
        ),
        new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(20.0),
                child: new TextFormField(
                  onSaved: (val) => _email = val,
                  decoration: new InputDecoration(labelText: "Email"),

                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(20.0),
                child: new TextFormField(
                 // onSaved: (val) => _password = val,
                  decoration: new InputDecoration(labelText: "Password"),
                  validator: (val) =>
                  val.length < 5 ? '6 characters password' : null,
                  onSaved: (val) => setState(() => _password = val),
                ),
              )
            ],
          ),
        ),
        new Padding(
          padding: const EdgeInsets.all(10.0),
          child: loginBtn,
        ),
        registerBtn
      ],
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login Page"),
      ),
      key: scaffolKey,
      body: new Container(
        child: new Center(
          child: loginForm,
        ),
      ),
    );
    return Container();
  }

  @override
  void onLoginError(String error) {
    // TODO: implement onLoginErrorf

    _showSnackBar("Login not successfull");

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void onLoginSuccess(User user) {
    // TODO: implement onLoginSuccess
    if (user.username == "") {
      _showSnackBar("Login successful  ");
    } else {
      _showSnackBar(user.toString());
    }

    setState(() {
      _isLoading = false;
    });

    if (user.flaglogged == "logged") {
      print("Logged");

      Navigator.of(context).pushNamed("/home");

    } else {
      print("Not Logged");
    }
  }
}
