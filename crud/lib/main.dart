import 'package:crud/views/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




Future<void> main()
async {

  runApp(
    ProviderScope(
      child: Home()
    )
  );

}
