import 'package:crud/views/widgets/AddUserWidget.dart';
import 'package:crud/views/widgets/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddUser extends ConsumerWidget
{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: Widgets.backButton(context),
        backgroundColor: Color.fromARGB(250, 0, 0, 0),
        title: Widgets.appBarTitle('Create user'),
        centerTitle: true,
      ),
      body: AddUserWidget(),
    );
  }

}