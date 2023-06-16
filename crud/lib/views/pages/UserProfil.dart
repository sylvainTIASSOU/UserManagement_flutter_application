import 'package:crud/views/widgets/userProfilWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
 class UserProfilPage extends ConsumerWidget
 {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(200, 2, 0, 0),
        title: Text('User profile'),
        centerTitle: true,
      ),
      body:UserProfilWidget(),
    );
  }

 }