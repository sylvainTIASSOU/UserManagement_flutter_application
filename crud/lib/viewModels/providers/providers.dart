


import 'package:crud/viewModels/databaseManager/databaseManager.dart';
import 'package:crud/viewModels/databaseManager/noficationDatabase.dart';
import 'package:crud/viewModels/editUserViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/Users.dart';
import '../../models/notification.dart';

class Providers
{
//methode to get data from db
  static final usersListProvider = FutureProvider<List<UsersModel>>((ref) async {

    return DatabaseManager.getAllUser();
  });

  static final notificationListProvider = FutureProvider<List<Notifications>>((ref) async {

    return NotificationDatabase.getAllNotif();
  });

  static final isVisibleProvider = StateProvider((ref) => true);
}