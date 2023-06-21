import 'package:crud/viewModels/globalFonctions.dart';
import 'package:crud/viewModels/services/serviceMethodes.dart';
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
  if(GlobalFonction.connectionChecked == 1)
    {
      ServiceMethodes.create(model);
      DatabaseManager.insertDB(model);
      Widgets.toastMsg('user create succefully');
    }
  else
    {
      DatabaseManager.insertDB(model);
      Widgets.toastMsg('user create succefully on lacal');
    }
  
  Navigator.pushReplacementNamed(context, '/page');
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


  //RegExp regex = RegExp(r'^[0-9]+$');
  //validate fields age
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