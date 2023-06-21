import 'package:crud/views/widgets/AddUserWidget.dart';
import 'package:crud/views/widgets/UpdateUserWidget.dart';
import 'package:crud/views/widgets/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewModels/editUserViewModel.dart';

class UpdateUser extends ConsumerWidget
{

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map? data = EditUserViewModel.getData(context);
    return Scaffold(
      
      appBar: AppBar(
        leading: Widgets.backButton(context),
        backgroundColor: Color.fromARGB(250, 0, 0, 0),
        title: Widgets.appBarTitle('Edit profile'),
        centerTitle: true,
      ),
      body: UpdateUserWidget(),

    );
  }

}