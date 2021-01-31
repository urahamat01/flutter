
import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';
import 'package:flutter_login_reg/models/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
   Database _db;
   String tableUser = "User";
   String columnName = "name";
   String columnUserName = "username";
   String columnPassword = "password";

Future<Database> get db async{

  if(_db != null){
    return _db;
  }

  _db = await initDb();
  return _db;

}

DatabaseHelper.internal();

initDb() async{

  Directory documentDirectory = await getApplicationDocumentsDirectory();
  String path = join(documentDirectory.path, "main.db");
  var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
  return ourDb;


}

void _onCreate(Database db, int version) async{
  await db.execute(
      "CREATE TABLE User(id INTEGER PRIMARY KEY, name TEXT, username TEXT, password TEXT, flaglogged TEXT)"
  );
  print("Table is created");

}


//insertion
  Future<int> saveUser(User user) async {
    var dbClient = await db;
    print(user.name);
    int res = await dbClient.insert("User", user.toMap());
    List<Map> list = await dbClient.rawQuery('SELECT * FROM User');
    print(list);
    return res;
  }

  //deletion
Future<int> deleteUser(User user)async{
  var dbClient = await db;
  int res = await dbClient.delete("User");
  return res;

}

//contact - update
  Future<int> updateContact(User user) async {
    //Database db = await database;
    return await _db.update(user.name, user.toMap(),
        where: '${User}=?', whereArgs: [user]);
  }

  Future<User> selectUser(User user) async{
    print("Select User");
    print(user.username);
    print(user.password);
    var dbClient = await db;
    List<Map> maps = await dbClient.query(tableUser,
        columns: [columnUserName, columnPassword],
        where: "$columnUserName = ? and $columnPassword = ?",
        whereArgs: [user.username,user.password]);
    print(maps);
    if (maps.length > 0) {
      print("User Exist !!!");
      return user;
    }else {
      return null;
    }
  }


}






