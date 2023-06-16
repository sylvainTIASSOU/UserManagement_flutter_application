import 'package:crud/models/Users.dart';
import 'package:crud/viewModels/userProfilViewModel.dart';
import 'package:crud/views/widgets/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/notification.dart';

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
          SizedBox(height: 30.0,),

          Container(
            padding: EdgeInsets.all(20),
              margin: EdgeInsets.only(left: 20, right: 20),
            height: 250,
            decoration: const BoxDecoration(
              color: Color.fromARGB(200, 236, 236, 239),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Column(
              children: [
                Container(
                  height: 150.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(200, 200, 200, 200),
                  ),
                ),

                SizedBox(height: 10,),
                Text('${data?['firstName']} ${data?['lastName']}',
                    style: const TextStyle(
                        color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                    )
                ),
                Text('${data?['age']} y/o'),


              ],
            ),
          ),

          const SizedBox(height: 100,),

          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: SizedBox(
              width: Widgets.width(context),
              height: 50,
              child: ElevatedButton(
                onPressed: (){
                  UserProfilViewModel.actionButtonEdit(context, data!);
                },
                child:Text('Edit profil'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),

              ),
            ),
          ),

          SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: SizedBox(
              width: Widgets.width(context),
              height: 50,
              child: ElevatedButton(
                onPressed: ()  {
                  Notifications notif = Notifications(minute: '${DateTime.now().minute.toString()}' , hour: '${DateTime.now().hour.toString()}', name: model.lastName, mode: 'deleted');
                  UserProfilViewModel.actionButtonDelete(context, model, notif);
                  Widgets.isVisible = true;
                  //Widgets.Dialog(context, 'Delete user?', 'The user and their data will be deleted? Do you want to proceed', 'No', 'Yes');
                },
                child:Text(
                    'Delete profil',
                style: TextStyle(
                  color: Colors.black
                )
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),

                ),

              ),
            ),
          ),
        ],
      ),
    );
  }

}