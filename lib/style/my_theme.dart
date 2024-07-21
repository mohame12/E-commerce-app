import 'package:e_commerce_app/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

  ThemeData lightTheme=ThemeData(
    fontFamily: 'Janna',
    primarySwatch: Colors.orange,
      scaffoldBackgroundColor: Colors.white,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 20,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.orange
      ),
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark
          ),
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20)
      )
  );

  ThemeData darkTheme=ThemeData(
    primarySwatch: Colors.blue,
      scaffoldBackgroundColor: Colors.black12,
      textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 20,
          backgroundColor: Colors.black12,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey
      ),
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.black,
              statusBarIconBrightness: Brightness.light
          ),
          backgroundColor: Colors.black12,
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),
          actionsIconTheme: IconThemeData(color: Colors.white)
      )
  );
