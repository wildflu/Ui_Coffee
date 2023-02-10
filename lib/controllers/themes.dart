

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Themes extends GetxController{
  static ThemeData thetheme = CustumDark;
  static ThemeData CustumDark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      toolbarHeight: 80,
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 0
    ),
    backgroundColor: Colors.black,
    

  );

  static ThemeData CustumLight = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      color: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0
    ),
  );
  
}