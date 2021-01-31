import 'package:sqflite/sqflite.dart';

class DbConn{
 
  Database database;
  
  Future initDB() async{
    if(database != null){
      return database;
      
    }
    
    String databasePath = await getDatabasesPath();
    
    database = await openDatabase(
      join(databasePath, 'income.bd'),
      onCreate: (db, version){
        return db.execute(
          "CREATE TABLE trans(id INTEGER PRIMARY KEY, date TEXT, name TEX, type TEXT, amount INTEGER )",);
      },
    version: 1,
    );
    return database;

  }

  String join(String databasePath, String s) {}
  
      
}