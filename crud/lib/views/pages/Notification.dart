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
    Widgets.isVisible = false;
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(250, 2, 0, 0),
        title: Widgets.appBarTitle('Notification'),
        centerTitle: true,
      ),
      body: NotificationsList()
    );
  }
}