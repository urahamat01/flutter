import 'package:flutter_login_reg/data/rest_data.dart';
import 'package:flutter_login_reg/models/user.dart';

abstract class LoginPageContract {
  void onLoginSuccess(User user);

  void onLoginError(String error);
}

class LoginPagePresenter {
  LoginPageContract _view;

  RestData api = new RestData();

  LoginPagePresenter(this._view);

  //Simulator login
  doLogin(String username, String password) {
    api
        .login(username, password)
        .then((user) => _view.onLoginSuccess(user))
        .catchError((onError) => _view.onLoginError(onError));
  }
}