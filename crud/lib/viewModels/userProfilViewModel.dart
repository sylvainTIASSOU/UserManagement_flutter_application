

import 'package:crud/models/Users.dart';
import 'package:crud/viewModels/globalFonctions.dart';
import 'package:crud/viewModels/services/serviceMethodes.dart';
import 'package:crud/views/widgets/Widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/notification.dart';
import 'databaseManager/databaseManager.dart';
import 'databaseManager/noficationDatabase.dart';

class UserProfilViewModel {
  static final checkConnection = GlobalFonction.connectionCheck();
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

 static  alertDialog(BuildContext context)
  {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Delete user?', textAlign: TextAlign.center,),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // Définir une bordure arrondie
            ),
            content: Container(
              width: Widgets.width(context), // Définir la largeur du dialogue
              child: Text('The user and their data will be deleted? Do you want to proceed', textAlign: TextAlign.center,),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Fermer'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),

              TextButton(
                child: Text('Fermer'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  //function of delete button
  static void actionButtonDelete(BuildContext context, UsersModel model, Notifications notif, id, idAPI) {
    showDialog(
        context: context,
        builder: (context) {
         return //Widgets.Dialog(context, 'Delete user?',  'The user and their data will be deleted? Do you want to proceed',  'No', 'Yes', Text('salut'));
         SimpleDialog(
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(16.0), // Définir une bordure arrondie
           ),
           title: Text('Delete user?', textAlign: TextAlign.center,),
           contentPadding: EdgeInsets.zero,
           children: [
             Container(
               //padding: EdgeInsets.all(10.0),
               width: Widgets.width(context),
               height: 155,

               child: Column(
                 children: [
                   SizedBox(height: 0,),
                   Text('The user and their data will be deleted? Do you want to proceed', textAlign: TextAlign.center,),
                   SizedBox(height: 0.0,),

                   Align(
                       alignment: Alignment.center,
                       child: Wrap(
                           children: [
                             SizedBox(
                               width: 155.0,
                               height: 38,
                               child: ElevatedButton(
                                 onPressed:  (){
                                   Navigator.of(context).pop();
                                 },
                                 child: Text('No', style: TextStyle(color: Color.fromARGB(200, 0, 0, 0)),),
                                 style: ButtonStyle(
                                   backgroundColor: MaterialStateProperty.all(Color.fromARGB(
                                       255, 246, 244, 244)),

                                 ),
                               ),
                             ),
                             SizedBox(width: 10,),

                             SizedBox(
                               width: 155.0,
                               height: 38,
                               child: ElevatedButton(
                                 onPressed:  () async {
                                   if(await checkConnection)
                                     {
                                       ServiceMethodes.delete(idAPI.toString()); //delete on Api
                                       DatabaseManager.deleteBD(model.lastName); //delete on sqlite
                                      // Widgets.toastMsg('usser delete succefully');
                                     }
                                   else
                                     {
                                       DatabaseManager.deleteBD(model.lastName); //delete on sqlite

                                     }
                                   Widgets.toastMsg('usser delete succefully');
                                   NotificationDatabase.insertDB(notif);
                                   Navigator.pushNamed(context, '/page');
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