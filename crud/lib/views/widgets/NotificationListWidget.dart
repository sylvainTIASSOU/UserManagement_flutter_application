import 'package:crud/models/notification.dart';
import 'package:crud/viewModels/databaseManager/databaseManager.dart';
import 'package:crud/viewModels/databaseManager/noficationDatabase.dart';
import 'package:crud/viewModels/providers/providers.dart';
import 'package:crud/viewModels/userListViewModel.dart';
import 'package:crud/views/pages/UserProfil.dart';
import 'package:crud/views/widgets/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../viewModels/globalFonctions.dart';
import '../../viewModels/services/serviceMethodes.dart';


class NotificationsList extends ConsumerStatefulWidget
{
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _NotificationsListState();
  }
}

class  _NotificationsListState extends ConsumerState<NotificationsList>
{
  bool connectionChecked = false;
  @override
  void initState() {
    super.initState();
    //ref.read(GlobalFonction.connectionCheckedProvider);
    connectionCheck();
  }
  //function to chek connection
  connectionCheck() async {
    try {
      const url = 'http://192.168.43.173:3000/';
      final uri = Uri.parse(url); // Convertir la chaîne en objet Uri
      final response = await http.get(uri);
      setState(() {
        if (response.statusCode == 200) {
          // La requête s'est effectuée avec succès
          // Effectuer le traitement des données de la réponse
          //GlobalFonction.connectionChecked = 1;
          connectionChecked = true;
        }
        else {
          // La requête a échoué
          //print('Erreur de requête: ${response.statusCode}
          //GlobalFonction.connectionChecked = 0;
          connectionChecked = false;
        }
      });

    } catch (e) {
      // Une exception s'est produite lors de la requête
      print('Erreur de connexion: $e');
      setState(() {
        connectionChecked = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
  final apiService = ServiceMethodes.getNotifications();
    final notificationProvider = ref.watch(Providers.notificationListProvider);
    if(connectionChecked)
      {
        return showNotif(context, apiService);
      }
    else
      {
        return showNotif(context, NotificationDatabase.getAllNotif());;
      }
  }

showNotif(BuildContext context, Future<List<Notifications>> future)
{
  return FutureBuilder<List<Notifications>>(
      future: future,
      builder: (BuildContext context, AsyncSnapshot<List<Notifications>> snapshot )
      {
        if(snapshot.hasData)
        {
          List<Notifications>?notification = snapshot.data;
          return ListView.builder(
              itemCount: notification?.length,
              itemBuilder: (context, index)
              {
                return Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                  child: Row(
                    children: [

                      Widgets.circle(Image.asset('assets/notification.png', height: 20, width: 16.93,)),
                      const SizedBox(width: 10,),
                      Expanded(
                          child: Text('${notification?[index].message}')
                      ),
                      Text('${notification?[index].hour} : ${notification?[index].minute}')

                    ],
                  ),
                );
              }
          );
        }
        else if(snapshot.hasError)
          {
            return  Center(child: Text(snapshot.error.toString()));
          }
        else{
          return const Center(child: CircularProgressIndicator(),);
        }
      }
  );
}
}