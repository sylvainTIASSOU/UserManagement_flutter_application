import 'package:crud/models/notification.dart';
import 'package:crud/viewModels/globalFonctions.dart';
import 'package:crud/viewModels/services/serviceMethodes.dart';
import 'package:crud/views/pages/AddUser.dart';
import 'package:crud/views/pages/UserList.dart';
import 'package:flutter/material.dart';
import '../models/Users.dart';
import '../views/pages/Page.dart';
import '../views/widgets/Widgets.dart';
import 'databaseManager/databaseManager.dart';
import 'databaseManager/noficationDatabase.dart';

class AddUserViewModel
{
  static final checkConnection = GlobalFonction.connectionCheck();
//methode to validate form
  void validated(val)
  {
    if(val.isEmpty())
      {
        'field required';
      }
    else
      null;
  }

  //button save action
static Future<void> actionSave(BuildContext context, UsersModel model, Notifications notif)
async {
  if(await checkConnection)
    {
      ServiceMethodes.create(model);
      DatabaseManager.insertDB(model);

    }
  else
    {
      DatabaseManager.insertDB(model);
    }
  Widgets.toastMsg('user create succefully');
  NotificationDatabase.insertDB(notif);
  //Navigator.of(context).pop();
  //Navigator.restorablePushReplacementNamed(context, '/page');
  Navigator.pushNamed(context, '/page');
  //Navigator.pushNamed(context, '/page');

}
//validate fields
 static validetor(String val)
 {
   if(val!.isEmpty)
     {
       return'field required';
     }
   else
     return null;
 }
  static validetorOfAge(String hint, val) {
    if (val!.isNotEmpty) {
      if (RegExp(r'^[0-9]+$').hasMatch(val)) {
         null;
      }
      else {
        return "The age must be a number";
      }
    }
    else {
       return "age required";
    }
  }
}