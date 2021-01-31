import 'dart:async';
import 'package:flutter_login_reg/models/user.dart';
import 'package:flutter_login_reg/data/database-helper.dart';

class RestData {
  static final BASE_URL = "";
  static final LOGIN_URL = BASE_URL + "/";

  Future<User> login(String username, String password) async {
    String flagLogged = "logged";

    var user = new User(null, username, password, null);
    var db = new DatabaseHelper();
    var userRetorno = new User(null, null, null, null);
    userRetorno = await db.selectUser(user);
    if (userRetorno != null) {
      flagLogged = "logged";
      return new Future.value(new User(null, username, password, flagLogged));
    } else {
      flagLogged = "not";
      return new Future.value(new User(null, username, password, flagLogged));
    }
  }
}
