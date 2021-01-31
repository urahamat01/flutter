import 'package:flutter/material.dart';
import 'package:flutter_api_auth/screens/forgot_password.dart';
import 'package:flutter_api_auth/screens/login_demo.dart';
import 'package:flutter_api_auth/screens/provider/provider.dart';
import 'package:flutter_api_auth/screens/services/auth_service.dart';
import 'package:flutter_api_auth/screens/signup_screen.dart';
import 'package:flutter_api_auth/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        title: 'Api Auth',
        home: FutureBuilder(
          future: AuthService.getToken(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasData) {
              return HmoeScreen();
            } else {
              return LoginScreen();
            }
          },
        ),
        routes: {
          '/home': (_) => new HmoeScreen(),
          '/login': (_) => new LoginScreen(),
          '/signup': (_) => new SignupScreen(),
          '/forgot_password': (_) => new ForgotPassword(),
        },
      ),
    );
  }
}
