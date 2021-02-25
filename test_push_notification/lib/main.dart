import 'package:flutter/material.dart';
import 'package:test_push_notification/screens/flight_search_page.dart';
import 'package:test_push_notification/screens/home_page.dart';
import 'package:test_push_notification/screens/my_cards_page.dart';

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
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FlightSearchPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
