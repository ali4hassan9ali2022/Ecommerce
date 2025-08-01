import 'package:e_commerce/Core/Utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightMode() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.lightScaffoldColor,
    cardColor: AppColors.lightCardColor,
    appBarTheme: const AppBarTheme(
      
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: AppColors.lightScaffoldColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    ),
    // primarySwatch: Colors.deepOrange,
    // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    //   type: BottomNavigationBarType.fixed,
    //   elevation: 20,
    //   selectedItemColor: Colors.deepOrange,
    //   unselectedItemColor: Colors.grey,
    //   backgroundColor: Colors.white,
    // ),
    brightness: Brightness.light,
  );
}

ThemeData darkTheme() {
  return ThemeData(
    // primarySwatch: Colors.deepOrange,
    scaffoldBackgroundColor: AppColors.darkScaffoldColor,
    cardColor: Color.fromARGB(255, 13, 6, 37),
    appBarTheme: AppBarTheme(
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: AppColors.darkScaffoldColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: HexColor("333739"),
      ),
      elevation: 0,
    ),
    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //   type: BottomNavigationBarType.fixed,
    //   backgroundColor: HexColor("333739"),
    //   selectedItemColor: Colors.deepOrange,
    //   unselectedItemColor: Colors.grey,
    // ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
    brightness: Brightness.dark,
  );
}
