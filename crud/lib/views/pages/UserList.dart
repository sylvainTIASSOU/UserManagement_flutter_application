import 'package:crud/viewModels/userListViewModel.dart';
import 'package:crud/views/pages/Notification.dart';
import 'package:crud/views/widgets/UserListWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserList extends ConsumerStatefulWidget
{
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _UserListState();
  }

}

class _UserListState extends ConsumerState<UserList>
{

  @override
  void initState() {
    //on recupert l'etate du provider ici
    // TODO: implement initState
    super.initState();
  }
  Widget build (BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(200, 2, 0, 0),
        title: Text('Users'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(200, 2, 0, 0),
        onPressed: (){
          //action
          UserListViewModel.moveToCreatePage(context);
        },
        child: Icon(Icons.create),
      ),
      body: UserListwidget()
    );
  }
}