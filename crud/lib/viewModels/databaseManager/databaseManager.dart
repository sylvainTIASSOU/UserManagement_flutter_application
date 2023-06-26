import 'package:crud/models/Users.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseManager
{
  DatabaseManager._();
  static final DatabaseManager instance = DatabaseManager._();
   //var _database= database() ;
  static  var database ;

 static Future<Database> get databases async
 {
   if(database!= null)
   {
     return database;
   }

   database = await initDB();
   return database;

 }


 static initDB() async
  {
    final path = join(await getDatabasesPath(), 'Usermanagerdb.db');
    WidgetsFlutterBinding.ensureInitialized();
    return await openDatabase(
        path,
        version: 1,
        //cree les tables
        onCreate: (db, version)
        {
           db.execute('CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT,firstName TEXT, lastName TEXT, age INTEGER)');
           db.execute('CREATE TABLE notification(idNotif INTEGER PRIMARY KEY AUTOINCREMENT, minute TEXT, hour TEXT,message TEXT)');
           //db.execute('CREATE TABLE notification(id INTEGER PRIMARY KEY AUTOINCREMENT, minute TEXT, hour TEXT, name TEXT, mode TEXT)');
        },

    );
  }

  //function to insert in db

static Future<void> insertDB(UsersModel user) async
{
  final Database db  = await databases;

  await db.insert(
      "users",
      user.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace
  );
}

//fonction to get all data of table
static Future<List<UsersModel>> getAllUser() async
{
  final Database db  = await databases;
  //requete de selection
  final List<Map<String, dynamic>> maps = await db.query("users"
      ,
      orderBy: "id DESC");
  return List.generate(maps.length, (i) {
    return UsersModel(
        id: maps[i]['id'],
        firstName: maps[i]['firstName'],
        lastName: maps[i]['lastName'],
        age: maps[i]['age']
    );
  });
}

//function of update
  static Future<void> updateDB(id, UsersModel user) async
{
  final Database db  = await databases;
  await db.update("users",
      user.toMap(),
  where: 'id = ?',
    whereArgs: [id]
  );
}

//function to delete
  static Future<void>deleteBD(String lastName) async
{
  final Database db  = await databases;
  await db.delete("users",
  where: 'lastName=?',
  whereArgs: [lastName]
  );
}

//fonction to getUserId

  static Future<int>  getUserId(Map<dynamic, dynamic> data) async
  {
    List<Map<String, dynamic>> results = await database.rawQuery(
      'SELECT id FROM users WHERE firstName= ? AND lastName = ?  AND age = ?',
      [data['firstName'], data['lastName'], data['age']],
    );

    if (results.isNotEmpty) {
      return results.first['id'];
    } else {
      return -1 ;
    }
  }

}