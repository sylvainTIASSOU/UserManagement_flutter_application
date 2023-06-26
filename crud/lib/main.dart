import 'package:crud/models/Users.dart';
import 'package:crud/viewModels/databaseManager/databaseManager.dart';
import 'package:crud/viewModels/globalFonctions.dart';
import 'package:crud/viewModels/globalFonctions.dart';
import 'package:crud/viewModels/globalFonctions.dart';
import 'package:crud/viewModels/globalFonctions.dart';
import 'package:crud/viewModels/services/notificationService.dart';
import 'package:crud/viewModels/services/serviceMethodes.dart';
import 'package:crud/viewModels/services/services.dart';
import 'package:crud/views/Home.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;



Future<void> main()
async {

  runApp(
    ProviderScope(
      child: Home()
    )
  );

}
