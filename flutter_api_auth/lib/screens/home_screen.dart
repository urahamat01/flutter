import 'package:flutter/material.dart';
import 'package:flutter_api_auth/screens/services/auth_service.dart';

class HmoeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 400),
          child: Column(
            children: [
              Text('Home Screen'),
              RaisedButton(
                  child: Text('Log out'),
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/login');
                    AuthService.removeToken();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
