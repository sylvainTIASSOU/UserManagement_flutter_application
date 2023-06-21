
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../models/notification.dart';
import 'databaseManager.dart';


class NotificationDatabase
{
  NotificationDatabase._();
  static final NotificationDatabase instance = NotificationDatabase._();
  //var _database= database() ;
  static  var databases = DatabaseManager.databases;

  // static Future<Database> get databases async
  // {
  //   if(database!= null)
  //   {
  //     return database;
  //   }
  //
  //   database = await initDB();
  //   return database;
  // }
  //
  //
  // static initDB() async
  // {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   return await openDatabase(
  //       join(await getDatabasesPath(), 'notificationdatabase6.db'),
  //
  //       //cree les tables
  //       onCreate: (db, version)
  //       {
  //         return db.execute('CREATE TABLE notification(id INTEGER PRIMARY KEY AUTOINCREMENT, minute TEXT, hour TEXT, name TEXT, mode TEXT)');
  //       },
  //       version: 1
  //   );
  // }

  //function to insert in db
  static Future<void> insertDB(Notifications notifications) async
  {
    final Database db  = await databases;

    await db.insert(
        "notification",
        notifications.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

//fonction to get all data of table
  static Future<List<Notifications>> getAllNotif() async
  {
    final Database db  = await databases;
    //requete de selection
    final List<Map<String, dynamic>> maps = await db.query("notification",
    orderBy: "id DESC");
    return List.generate(maps.length, (i) {
      return Notifications(
        id: maps[i]['id'],
        minute: maps[i]['minute'],
          hour: maps[i]['hour'],
          name: maps[i]['name'],
        mode: maps[i]['mode'],
      );
    });
  }

//function of update
  static Future<void> updateDB(Notifications notifications) async
  {
    final Database db  = await databases;
    await db.update("notification",
        notifications.toMap(),
        where: 'name=?',
        whereArgs: [notifications.name]
    );
  }

//function to delete
  static Future<void>deleteBD(String name) async
  {
    final Database db  = await databases;
    await db.delete("notification",
        where: 'lastName=?',
        whereArgs: [name]
    );
  }
}