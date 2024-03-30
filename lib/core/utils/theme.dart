import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_manager.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    //1
    return ThemeData(
      //2
      primaryColor: ColorManager.primaryOrange,
      scaffoldBackgroundColor: Colors.grey.shade100,
      fontFamily: GoogleFonts.ubuntu().fontFamily, //3
      iconTheme: IconThemeData(color: Colors.grey.shade800),
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: ColorManager.primaryOrange),
          toolbarTextStyle: TextStyle(color: ColorManager.primaryOrange),
          elevation: 0,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 16),
          backgroundColor: ColorManager.primaryOrange,
          foregroundColor: ColorManager.primaryOrange),
      cardColor: Colors.blueGrey[100],
      textTheme: Typography.blackCupertino,
      dividerColor: Colors.grey.shade800,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          backgroundColor: ColorManager.primaryOrange,
          selectedItemColor: Colors.white,
          selectedLabelStyle: TextStyle(
              color: ColorManager.primaryOrange, fontWeight: FontWeight.bold),
          unselectedItemColor: Colors.grey),
      buttonTheme: ButtonThemeData(
        // 4
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        buttonColor: Colors.white,
      ),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.white),
              overlayColor: MaterialStateProperty.all(Colors.grey.shade800),
              backgroundColor: MaterialStateProperty.all(
                  ColorManager.scaffoldBackgroundColor))),
      tabBarTheme: const TabBarTheme(
        labelColor: ColorManager.primaryOrange,
        unselectedLabelColor: Colors.grey,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: ColorManager.primaryOrange, width: 2.0),
        ),
        labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
        primaryColor: Colors.grey,
        scaffoldBackgroundColor: ColorManager.primaryOrange,
        fontFamily: GoogleFonts.ubuntu().fontFamily,
        iconTheme: const IconThemeData(color: Colors.white),
        appBarTheme: AppBarTheme(
            iconTheme: const IconThemeData(color: Colors.white),
            toolbarTextStyle: const TextStyle(color: Colors.white),
            elevation: 0,
            titleTextStyle: const TextStyle(color: Colors.white, fontSize: 16),
            backgroundColor: Colors.grey.shade900,
            foregroundColor: ColorManager.primaryOrange),
        cardColor: Colors.grey[900],
        inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(color: Colors.grey.shade600),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                borderSide: const BorderSide(color: Colors.white))),
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
                overlayColor: MaterialStateProperty.all(Colors.grey.shade800),
                backgroundColor:
                    MaterialStateProperty.all(Colors.grey.shade800))),
        textTheme: Typography.whiteCupertino,
        dividerColor: Colors.grey.shade400,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: ColorManager.primaryOrange,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: Colors.white,
            selectedLabelStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            unselectedItemColor: Colors.white.withAlpha(50)),
        buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: Colors.white,
        ));
  }
}
