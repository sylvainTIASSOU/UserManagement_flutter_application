import 'package:crud/viewModels/notificationViewModel.dart';
import 'package:crud/viewModels/providers/providers.dart';
import 'package:crud/views/widgets/NotificationListWidget.dart';
import 'package:crud/views/widgets/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationPage extends ConsumerStatefulWidget
{
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _NotificationState();
  }
}

class _NotificationState extends ConsumerState<NotificationPage>
{
  @override
  void initState() {
    super.initState();
    ref.read(NotificationViewModel.provider);
    Widgets.isVisible = false;
  }
  @override
  Widget build(BuildContext context) {
   final number = ref.watch(NotificationViewModel.provider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(200, 2, 0, 0),
        title: Text('Notification'),
        centerTitle: true,
      ),
      body: NotificationsList()
    );
  }

}