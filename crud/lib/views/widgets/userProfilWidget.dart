import 'package:crud/models/Users.dart';
import 'package:crud/viewModels/userProfilViewModel.dart';
import 'package:crud/views/widgets/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/notification.dart';
import '../../viewModels/databaseManager/databaseManager.dart';
import '../../viewModels/services/serviceMethodes.dart';

class UserProfilWidget extends ConsumerWidget
{
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    //recuperation des donnés
   Map? data = UserProfilViewModel.getData(context);
   UsersModel model = UsersModel(id: null,firstName: data?['firstName'], lastName: data?['lastName'], age: data?['age']);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 115.0,),

          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(left: 20, right: 20),
            height: 304,
            width: Widgets.width(context),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromARGB(27, 19, 19, 19),
                width: 2
              ),
              //color: Color.fromARGB(255, 243, 245, 248),
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
            child: Column(
              children: [
                Container(
                  height: 180,
                  width: 180,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(236, 226, 233, 239),
                  ),
                ),

                SizedBox(height: 10,),
                Text('${data?['firstName']} ${data?['lastName']}',
                    style: const TextStyle(
                        color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 20
                    )
                ),
                Text('${data?['age']} y/o',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400
                ),),
              ],
            ),
          ),

          const SizedBox(height: 196,),

          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black,

            ),
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            width: Widgets.width(context),
            height: 48,
            child: ElevatedButton(
                onPressed: (){
                  UserProfilViewModel.actionButtonEdit(context, data!);
                },
                child:Widgets.textButton('Edit profil'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),

              ),
            ),


          SizedBox(height: 10,),

          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(236, 226, 233, 239),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Color.fromARGB(236, 226, 233, 239),
                width: 2
              )
            ),
            width: Widgets.width(context),
            height: 50,
            margin: EdgeInsets.only(left: 20.0, right: 20.0),
            child:  TextButton(
                onPressed: ()  async {
                  //UserProfilViewModel.alertDialog(context);
                  int id = await  DatabaseManager.getUserId(data!);
                  Notifications notif = Notifications(idNotif: null, minute: '${DateTime.now().minute.toString()}' , hour: '${DateTime.now().hour.toString()}', message: '${data['lastName']}  deleted');
                  var idAPI = await ServiceMethodes.getId(data['firstName']);
                  UserProfilViewModel.actionButtonDelete(context, model, notif, id, idAPI);
                  Widgets.isVisible = true;
                  //Widgets.Dialog(context, 'Delete user?', 'The user and their data will be deleted? Do you want to proceed', 'No', 'Yes');
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(
                      236, 226, 233, 239)),
                ),
                child:const Text(
                    'Delete profil',
                style: TextStyle(
                  color: Colors.black
                )
                ),

              ),
            ),

          SizedBox(height: 20,),
        ],
      ),
    );
  }

}