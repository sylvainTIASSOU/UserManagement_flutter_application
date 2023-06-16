import 'package:crud/views/pages/AddUser.dart';
import 'package:flutter/material.dart';

import '../models/Users.dart';

class UserListViewModel
{
//user profile buton when we tap on user
static void moveToUserProfil(BuildContext context, List<UsersModel> user, index)
{
  Navigator.pushNamed(context, '/userProfil',
      arguments: {
    'firstName' : user[index].firstName,
        'lastName': user[index].lastName,
        'age': user[index].age,
      });
}
  //create button
  static void moveToCreatePage(BuildContext context)
  {
    //Navigator.pushReplacementNamed(context, '/addUser');
    //Navigator.push(context, MaterialPageRoute(builder: (context) => AddUser()));
    Navigator.pushNamed(context, '/addUser');
  }
}