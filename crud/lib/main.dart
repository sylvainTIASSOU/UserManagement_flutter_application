import 'package:crud/models/Users.dart';
import 'package:crud/viewModels/databaseManager/databaseManager.dart';
import 'package:crud/viewModels/services/serviceMethodes.dart';
import 'package:crud/views/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<void> main()
async {
  runApp(
    ProviderScope(
      child: Home()
    )
  );
  //print(ServiceMethodes.gettAll());
}
