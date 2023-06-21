

import 'package:crud/models/Users.dart';
import 'package:crud/models/notification.dart';
import 'package:crud/viewModels/globalFonctions.dart';
import 'package:crud/viewModels/services/serviceMethodes.dart';
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

static void actionButtonSaveChanges(BuildContext context, UsersModel model, Notifications notif, id)
{
  showDialog(
      context: context,
      builder: (context) {
        return //Widgets.Dialog(context, 'Save changes?',  'The modifications you made will update the data',  'Cancel', 'Save', 5);
          SimpleDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0), // Définir une bordure arrondie
            ),
            title: Text('Save changes?', textAlign: TextAlign.center,),
            contentPadding: EdgeInsets.zero,
            children: [
              Container(
                //padding: EdgeInsets.all(10.0),
                width: Widgets.width(context),
                height: 155,

                child: Column(
                  children: [
                    SizedBox(height: 0.0,),
                    Text('The modifications you made will update the data', textAlign: TextAlign.center,),

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
                                  child: Text('Cancel', style: TextStyle(color: Color.fromARGB(200, 0, 0, 0)),),
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
                                  onPressed:  (){
                                    if(GlobalFonction.connectionChecked == 1)
                                      {
                                        ServiceMethodes.update(id.toString(), model); // update on API
                                        Widgets.toastMsg('usser update succefully on API');
                                      }
                                    else
                                      {
                                        DatabaseManager.updateDB(model); // Update on Sqlite
                                        NotificationDatabase.insertDB(notif);
                                        Widgets.toastMsg('usser update succefully on Local');
                                      }

                                    Navigator.of(context).pop();
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