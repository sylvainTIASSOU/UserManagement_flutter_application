import 'package:crud/models/notification.dart';
import 'package:crud/viewModels/databaseManager/databaseManager.dart';
import 'package:crud/viewModels/databaseManager/noficationDatabase.dart';
import 'package:crud/viewModels/providers/providers.dart';
import 'package:crud/viewModels/userListViewModel.dart';
import 'package:crud/views/pages/UserProfil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/Users.dart';

class NotificationsList extends ConsumerStatefulWidget
{
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _NotificationsListState();
  }
}

class  _NotificationsListState extends ConsumerState<NotificationsList>
{
@override
  void initState() {
    super.initState();
    ref.read(Providers.notificationListProvider);
  }
  @override
  Widget build(BuildContext context) {
    final notificationProvider = ref.watch(Providers.notificationListProvider);
    return FutureBuilder<List<Notifications>>(
      future: NotificationDatabase.getAllNotif(),
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

                            Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(200, 200, 200, 200),
                              ),
                              child: const Icon(Icons.notifications_outlined, size: 25.0,),
                            ),
                            const SizedBox(width: 10,),
                            Expanded(
                                child: Text('${notification?[index].name}  ${notification?[index].mode}')
                            ),

                            Text('${notification?[index].hour} : ${notification?[index].minute}')

                          ],
                        ),
                      );
                    }
            );
          }
        else{
          return const Center(child: CircularProgressIndicator(),);
        }
      }
    );
  }

}