import 'package:crud/views/widgets/AddUserWidget.dart';
import 'package:crud/views/widgets/UpdateUserWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateUser extends ConsumerWidget
{

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(200, 0, 0, 0),
        title: Text('Edit profile'),
        centerTitle: true,
      ),
      body: UpdateUserWidget(),
      drawerScrimColor: Color.fromARGB(200, 0, 0, 0),
    );
  }

}