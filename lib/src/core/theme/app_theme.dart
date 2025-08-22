import 'package:flutter/material.dart';
import 'package:quiz_assesment/src/core/theme/app_color.dart';

class AppTheme{
  static  ThemeData get lightTheme{
    return ThemeData(
       useMaterial3: true,
       primaryColor: kPrimaryColor,
       scaffoldBackgroundColor: kBgColor,
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.bold
        ),
        bodyMedium: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w400
        ),
        bodySmall: TextStyle(
            fontSize: 16,
            color: Colors.black,
        ),
      ),
      appBarTheme: _appBarTheme(isDark: true),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          backgroundColor: kPrimaryColor,
          textStyle: TextStyle(
            fontSize: 18,
            fontWeight:FontWeight.w600,
            color: Colors.white
          )
        )
      )
    );
  }

}


  AppBarTheme _appBarTheme({required bool isDark}){
  return AppBarTheme(
      backgroundColor: kBgColor,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.black,
      ),
      centerTitle: true,
      iconTheme: IconThemeData(
          color: Colors.black
      ),
     actionsPadding: EdgeInsets.only(right: 10)
  );
  }