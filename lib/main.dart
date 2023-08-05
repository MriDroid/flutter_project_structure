import 'package:flutter/material.dart';
import 'package:orders_system/core/services/initializer.dart';
import 'package:orders_system/core/utils/app_strings.dart';

Future<void> main() async {
  await Initializer.mainInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Container(),
    );
  }
}
