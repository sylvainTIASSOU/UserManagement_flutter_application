import 'package:crud/models/notification.dart';
import 'package:crud/viewModels/databaseManager/databaseManager.dart';
import 'package:crud/viewModels/databaseManager/noficationDatabase.dart';
import 'package:crud/viewModels/providers/providers.dart';
import 'package:crud/viewModels/userListViewModel.dart';
import 'package:crud/views/pages/UserProfil.dart';
import 'package:crud/views/widgets/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


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

                            Widgets.circle(Image.asset('assets/notification.png', height: 20, width: 16.93,)),
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