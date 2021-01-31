class User {
  //int id;
  String _name;
  String _username;
  String _passwrod;
  String _flaglogged;






  User(this._name, this._username, this._passwrod, this._flaglogged);

  User.map(dynamic obj) {
    this._name = obj['name'];
    this._username = obj['username'];
    this._passwrod = obj['password'];
    this._flaglogged = obj['password'];
  }

  String get name => _name;

  String get username => _username;

  String get password => _passwrod;

  String get flaglogged => _flaglogged;



  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["name"] = _name;
    map["username"] = _username;
    map["password"] = _passwrod;
    map["flaglogged"] = _flaglogged;

    return map;
  }

  static fromJson(decode) {}


}
