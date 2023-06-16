import 'package:flutter/material.dart';

import '../models/Users.dart';
import '../views/widgets/Widgets.dart';
import 'databaseManager/databaseManager.dart';

class AddUserViewModel
{
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
static void actionSave(BuildContext context, UsersModel model)
{
  DatabaseManager.insertDB(model);
  Widgets.toastMsg('user create succefully');
  Navigator.pushReplacementNamed(context, '/page');
}
}