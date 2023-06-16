

import 'package:crud/models/Users.dart';
import 'package:crud/models/notification.dart';
import 'package:crud/views/pages/Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../views/widgets/Widgets.dart';
import 'databaseManager/databaseManager.dart';
import 'databaseManager/noficationDatabase.dart';

class EditUserViewModel
{

  //function to get data from page
  static Map? getData(BuildContext context) {
    Map? data = {};
    data = ModalRoute
        .of(context)
        ?.settings
        .arguments as Map?;
    return data;
  }

//function of the save changes button

static void actionButtonSaveChanges(BuildContext context, UsersModel model, Notifications notif)
{
  showDialog(
      context: context,
      builder: (context) {
        return //Widgets.Dialog(context, 'Save changes?',  'The modifications you made will update the data',  'Cancel', 'Save', 5);
          SimpleDialog(
            title: Text('Save changes?', textAlign: TextAlign.center,),
            contentPadding: EdgeInsets.zero,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),

                child: Column(
                  children: [
                    SizedBox(height: 15.0,),
                    Text('The modifications you made will update the data', textAlign: TextAlign.center,),

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
                                  child: Text('Cancel', style: TextStyle(color: Color.fromARGB(200, 0, 0, 0)),),
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
                                    DatabaseManager.updateDB(model);
                                    NotificationDatabase.insertDB(notif);
                                    Navigator.of(context).pop();
                                    Widgets.toastMsg('usser update succefully');
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => PageHome()));

                                  },
                                  child: Text('Save'),
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
}