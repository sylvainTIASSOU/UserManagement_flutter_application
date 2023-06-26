

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
  static final checkConnection = GlobalFonction.connectionCheck();
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
static void actionButtonSaveChanges(BuildContext context, UsersModel model, Notifications notif, id, int idApi, UsersModel model2)
{
  showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
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
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(
                                        255, 246, 244, 244)),

                                  ),
                                  child: Text('Cancel', style: TextStyle(color: Color.fromARGB(200, 0, 0, 0)),),
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
                                        ServiceMethodes.update(idApi, model2); // update on API
                                        DatabaseManager.updateDB(id, model); // Update on Sqlite
                                        //Widgets.toastMsg('usser update succefully on API');
                                      }
                                    else
                                      {
                                        DatabaseManager.updateDB(id, model); // Update on Sqlite


                                      }
                                    NotificationDatabase.insertDB(notif);
                                    Widgets.toastMsg('usser update succefully');
                                    //Navigator.of(context).pop();
                                    Navigator.pushNamed(context, "/page");

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