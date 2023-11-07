// ignore_for_file: unnecessary_import

import 'package:tutorial_fitur_favorite/core.dart';
import 'package:flutter/material.dart';
import 'module/main_navigation/view/main_navigation_view.dart';
import 'module/service/db_service/db_service.dart';
import 'state_util.dart';

void main() async {
  await DBService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Add Favorite App',
      navigatorKey: Get.navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MainNavigationView(),
    );
  }
}
