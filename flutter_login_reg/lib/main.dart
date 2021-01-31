import 'package:flutter/material.dart';
import 'package:flutter_login_reg/screen/login/login_page.dart';
import 'package:flutter_login_reg/screen/login/register.dart';
import 'package:flutter_login_reg/screen/home_page.dart';

void main() {
  runApp(MyApp());
}

final routes = {
  '/login': (BuildContext context) => new LoginPage(),
  '/home': (BuildContext context) => new HomePage(),
  '/register': (BuildContext context) => new RegisterPage(),
  '/': (BuildContext context) => new LoginPage(),
};


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LogIn Form',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: routes,
    );
  }
}
