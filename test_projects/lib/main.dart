import 'package:flutter/material.dart';
import 'package:test_projects/screens/dashboard/dashboard_page.dart';
import 'package:test_projects/screens/login/login_screen.dart';
import 'package:test_projects/screens/signup/signup.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('SignIn'),
            centerTitle: true,
          ),
          body: LoginScreen(),

        ),
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          //"/": (BuildContext context) => SignUp(),
          "/loginscreen": (BuildContext context) => LoginScreen(),
          "/signpage": (BuildContext context) => SignPage(),
          "/SignPage": (BuildContext context) => SignPage(),
          "/dashboardPage": (BuildContext context) => DashboardPage(),


        });
  }
}
