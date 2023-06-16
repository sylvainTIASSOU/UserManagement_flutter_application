

import 'package:crud/models/Users.dart';
import 'package:crud/views/widgets/Widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/notification.dart';
import 'databaseManager/databaseManager.dart';
import 'databaseManager/noficationDatabase.dart';

class UserProfilViewModel {
  //function to get data from the other page
  static Map? getData(BuildContext context) {
    Map? data = {};
    data = ModalRoute
        .of(context)
        ?.settings
        .arguments as Map?;
    return data;
  }


  action()
  {
    print('salut');
  }
  //function of delete button
  static void actionButtonDelete(BuildContext context, UsersModel model, Notifications notif) {
    showDialog(
        context: context,
        builder: (context) {
         return //Widgets.Dialog(context, 'Delete user?',  'The user and their data will be deleted? Do you want to proceed',  'No', 'Yes', Text('salut'));
         SimpleDialog(
           title: Text('Delete user?', textAlign: TextAlign.center,),
           contentPadding: EdgeInsets.zero,
           children: [
             Padding(
               padding: EdgeInsets.all(10.0),

               child: Column(
                 children: [
                   SizedBox(height: 15.0,),
                   Text('The user and their data will be deleted? Do you want to proceed', textAlign: TextAlign.center,),

                   SizedBox(height: 15.0,),

                   Align(
                       alignment: Alignment.center,
                       child: Wrap(
                           children: [
                             SizedBox(
                               width: 120.0,
                               child: ElevatedButton(
                                 onPressed:  (){
                                   Navigator.of(context).pop();
                                 },
                                 child: Text('No', style: TextStyle(color: Color.fromARGB(200, 0, 0, 0)),),
                                 style: ButtonStyle(
                                   backgroundColor: MaterialStateProperty.all(Color.fromARGB(
                                       200, 196, 191, 191)),

                                 ),
                               ),
                             ),
                             SizedBox(width: 10,),

                             SizedBox(
                               width: 120.0,
                               child: ElevatedButton(
                                 onPressed:  (){
                                   DatabaseManager.deleteBD(model.lastName);
                                   NotificationDatabase.insertDB(notif);
                                   Widgets.toastMsg('usser delete succefully');
                                   Navigator.pushReplacementNamed(context, '/page');
                                 },
                                 child: Text('Yes'),
                                 style: ButtonStyle(
                                   backgroundColor: MaterialStateProperty.all(Colors.black),

                                 ),
                               ),
                             ),


                           ]
                       )
                   ),
                 ],
               ),
             ),

           ],
         );
        });
  }

  //finction of edit profil button

static void actionButtonEdit(BuildContext context, Map data)
{
  data = UserProfilViewModel.getData(context)!;
  Navigator.pushNamed(context, '/editUser',
  arguments:
  {
    'firstName' : data['firstName'],
    'lastName': data['lastName'],
    'age': data['age']

  });
}
}