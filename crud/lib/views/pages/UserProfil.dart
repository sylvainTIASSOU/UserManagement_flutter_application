import 'package:crud/views/widgets/Widgets.dart';
import 'package:crud/views/widgets/userProfilWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
 class UserProfilPage extends ConsumerWidget
 {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: Widgets.backButton(context),
        backgroundColor: Color.fromARGB(250, 2, 0, 0),
        title: Widgets.appBarTitle('User profile'),
        centerTitle: true,
      ),
      body:UserProfilWidget(),
    );
  }

 }