import 'package:crud/views/widgets/AddUserWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddUser extends ConsumerWidget
{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(200, 2, 0, 0),
        title: Text('Create user'),
        centerTitle: true,
      ),
      body: AddUserWidget(),
    );
  }

}