
import 'dart:async';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;

class AuthService{
  final baseUrl = 'https://api.forio.com/v2/password/recovery';
  static final SESSION = FlutterSession();

  Future<dynamic> register (String email, String password)async{
    try{
      var res = await http.post('$baseUrl/v2/password/recovery', body: {
        'email': email,
        'password': password,
      });

      return res ?.body;
    }finally{

    }

  }

  Future<dynamic>login(String email, String password)async{
    try {
      var res = await http.post(
        '$baseUrl/v2/password/recovery',
        body: {
          'email': email,
          'password': password,
          'token': 'eyJhbGciOiJSUzI1NiJ9',
        },
      );

      return res?.body;
    } finally {
      // you can do somethig here
    }
  }

  static setToken (String token, String refreshToken)async{
    _AuthData data = _AuthData(token, refreshToken);
    await SESSION.set('tokens', data);

  }

  static Future<Map<String, dynamic>>getToken()async{
    return await SESSION.get('tokens');

}

static removeToken()async{
    await SESSION.prefs.clear();
}



}
class _AuthData{

  String token, refreshToken, clientId;

  _AuthData(this.token, this.refreshToken, {this.clientId});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['token'] = token;
    data['refreshToken'] = refreshToken;
    data['clientId'] = clientId;
    return data;
  }

}