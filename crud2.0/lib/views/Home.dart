import 'package:crud/views/pages/AddUser.dart';
import 'package:crud/views/pages/Notification.dart';
import 'package:crud/views/pages/Page.dart';
import 'package:crud/views/pages/UpdateUser.dart';
import 'package:crud/views/pages/UserList.dart';
import 'package:crud/views/pages/UserProfil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        fontFamily: 'JetBrainsMono',
      ),
      title: 'home page',
    //  home: UserList(),

      initialRoute: '/page',
      routes:{
        '/page': (context) => PageHome (),
        '/userList': (context) => UserList(),
        '/addUser': (context) => AddUser(),
        '/editUser': (context) => UpdateUser(),
        '/userProfil': (context) => UserProfilPage(),
       '/notification': (context) => NotificationPage(),
      },
    );
  }

}