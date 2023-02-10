import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'Screens_ui/home_screen.dart';
import 'controllers/themes.dart';




void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      home: const MyApp(),
      title: "MyApp",
      theme: Themes.CustumDark,
    ),
    
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}